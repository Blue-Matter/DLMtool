# test LBSPR_test.cpp - TMP version

#' Internal Estimation Function for LBSPR MP
#'
#' @param x Iteration number
#' @param Data An object of class `Data`
#' @param reps Number of samples. Not used in this method.
#' @param n Numeric. Number of historical years to run the model.
#' @param smoother Logical. Should estimates be smoothed over multiple years?
#' @param R variance of sampling noise
#'
#' @export
#' @keywords internal


LBSPR2_ <- function(x, Data, reps, n=5, smoother=TRUE, R=0.2) {
  if (MSEtool::NAor0(Data@L50[x])) stop("Data@L50 is NA")
  if (MSEtool::NAor0(Data@L95[x])) stop("Data@L95 is NA")
  if (MSEtool::NAor0(Data@wlb[x])) stop("Data@wlb is NA")

  LenBins <- Data@CAL_bins
  By <- LenBins[2] - LenBins[1]
  LenMids <- seq(from=By*0.5, by=By, length.out = length(LenBins)-1)
  CVLinf <- Data@LenCV[x]
  MK <- Data@Mort[x]/Data@vbK[x]
  Linf <- Data@vbLinf[x]
  L50 <- Data@L50[x]
  L95 <- Data@L95[x]
  Beta <- Data@wlb[x]

  n <- min(n, nrow(Data@CAL[x,,]))
  if (length(Data@Misc) ==0) Data@Misc[[x]] <- NA
  if (length(Data@Misc[[x]]) ==0) Data@Misc[[x]] <- NA

  nage <- 101
  P <- 0.01
  xs <- seq(0, to=1, length.out = nage)
  rLens <- 1-P^(xs/MK)
  EL <- rLens * Linf
  SDL <- EL * CVLinf
  Ml <- 1/(1+exp(-log(19.0)* (LenMids-L50)/(L95-L50)));
  nlen <- length(LenMids)

  Prob <- matrix(1E-4, nrow=nage, ncol=length(LenMids))
  for (aa in 1:nage) {
    d1 <- dnorm(LenMids, EL[aa], SDL[aa])
    t1 <- dnorm(EL[aa] + SDL[aa]*2.5, EL[aa], SDL[aa]) # truncate at 2.5 sd
    d1[d1<t1] <- 0
    if (!all(d1==0)) Prob[aa,] <- d1/sum(d1)
  }

  if (all(is.na(Data@Misc[[x]]))) { # first time it's being run

    # run model for n most recent years
    yind <- match(Data@LHYear[1], Data@Year)
    CALdata <- Data@CAL[x, (yind-n+1):length(Data@Year),]
    if (inherits(CALdata,'numeric'))  CALdata <- matrix(CALdata, ncol=length(LenMids))
    Ests <- matrix(NA, nrow=nrow(CALdata), ncol=5)
    Ests_smooth <- matrix(NA, nrow=nrow(CALdata), ncol=4)
    Ests_smooth <- as.data.frame(Ests_smooth)
    Fit <- list()

    for (y in 1:nrow(CALdata)) {
      CAL <- CALdata[y,]
      if (any(is.na(CAL))) {
        Ests[y,] <- NA
        Fit[[y]] <- NA
      } else {
        data <- list(model='LBSPR_test',
                     MK=MK,
                     Beta=Beta,
                     Linf=Linf,
                     nage=nage,
                     nlen=nlen,
                     CAL=CAL,
                     LenMids=LenMids,
                     rLens=rLens,
                     Ml=Ml,
                     Prob=Prob)

        modalL <- LenMids[which.max(CAL)]
        minL <- LenMids[min(which(CAL>0))]
        sl50start <-  mean(c(modalL, minL))

        # sl50start <- LenMids[min(which(cumsum(CAL)/sum(CAL)>0.1))]

        log_sl50 <- log(sl50start/Linf)
        log_dsl50 <- log(sl50start/Linf*0.1)
        log_fm <- log(0.99)
        parameters <- list(log_sl50=log_sl50,
                           log_dsl50=log_dsl50,
                           log_fm=log_fm)

        obj <- TMB::MakeADFun(data=data, parameters=parameters, DLL="DLMtool_TMBExports",
                              silent=TRUE, hessian=FALSE)

        # bounds on SL50
        lower <- rep(-Inf, 3)
        upper <- rep(Inf, 3)
        upper[1] <- log(modalL/Linf)
        lower[1] <- log(0.02)
        lower[2] <- log(0.05)

        starts <- obj$par

        doopt <- optimize_TMB(obj, bounds=list(lower, upper), starts=starts)

        report <- obj$report(obj$env$last.par.best)
        SL50 <- report$sl50
        SL95 <- report$sl95
        FM <- report$FM
        SPR <- report$SPR
        pred <- report$Nc_st
        NLL <- report$`-nll`
        Ests[y,] <- c(SL50, SL95, FM, SPR, NLL)
        Fit[[y]] <- pred * sum(CALdata[y,])
      }

    }


    if (nrow(Ests)>1) {
      Ests_smooth <- apply(Ests, 2, FilterSmooth)
    } else {
      Ests_smooth <- Ests
    }
    Ests_smooth <- as.data.frame(Ests_smooth)
    # if (smoother && nrow(Ests) > 1) Ests <- apply(Ests, 2, FilterSmooth)

    Ests <- as.data.frame(Ests)
    names(Ests) <- c("SL50", "SL95", "FM", "SPR", "NLL")
    Ests$Year <- Data@Year[(yind - n + 1):length(Data@Year)]

    names(Ests_smooth) <- c("SL50", "SL95", "FM", "SPR", "NLL")
    Ests_smooth$Year <- Data@Year[(yind - n + 1):length(Data@Year)]

  } else {
    lastYr <- max(Data@Misc[[x]]$Ests$Year)
    curYr <- max(Data@Year)
    yrs <- (lastYr+1):curYr

    CALdata <- Data@CAL[x, (length(Data@Year)-length(yrs)+1):length(Data@Year),]
    if (inherits(CALdata,'numeric'))  CALdata <- matrix(CALdata, ncol=length(LenMids))
    Ests_smooth <- matrix(NA, nrow=nrow(CALdata), ncol=4)
    Ests_smooth <- as.data.frame(Ests_smooth)
    Ests <- matrix(NA, nrow=nrow(CALdata), ncol=5)
    Fit <- list()
    for (y in 1:nrow(CALdata)) {
      CAL <- CALdata[y,]
      if (any(is.na(CAL))) {
        Ests[y,] <- NA
        Fit[[y]] <- NA
      } else {
        data <- list(model='LBSPR_test',
                     MK=MK,
                     Beta=Beta,
                     Linf=Linf,
                     nage=nage,
                     nlen=nlen,
                     CAL=CAL,
                     LenMids=LenMids,
                     rLens=rLens,
                     Ml=Ml,
                     Prob=Prob)

        modalL <- LenMids[which.max(CAL)]
        minL <- LenMids[min(which(CAL>0))]
        sl50start <-  mean(c(modalL, minL))

        log_sl50 <- log(sl50start/Linf)
        log_dsl50 <- log(sl50start/Linf*0.1)
        log_fm <- log(0.99)
        parameters <- list(log_sl50=log_sl50,
                           log_dsl50=log_dsl50,
                           log_fm=log_fm)

        obj <- TMB::MakeADFun(data, parameters, DLL="DLMtool_TMBExports", silent=TRUE, hessian=FALSE)
        # bounds on SL50
        lower <- rep(-Inf, 3)
        upper <- rep(Inf, 3)
        upper[1] <- log(modalL/Linf)
        lower[1] <- log(0.02)
        lower[2] <- log(0.05)

        starts <- obj$par
        doopt <- optimize_TMB(obj, bounds=list(lower, upper), starts=starts)
        report <- obj$report(obj$env$last.par.best)


        SL50 <- report$sl50
        SL95 <- report$sl95
        FM <- report$FM
        SPR <- report$SPR
        pred <- report$Nc_st
        NLL <- report$`-nll`

        Ests[y,] <- c(SL50, SL95, FM, SPR, NLL)
        Fit[[y]] <- pred * sum(CALdata[y,])
      }
    }

    #
    # ## Plot ###
    # par(mfrow=c(2,3))
    # for (y in 1:nrow(CALdata)) {
    #   tt <- barplot(CALdata[y,], names.arg=LenMids)
    #   lines(tt, Fit[[y]], lwd=2)
    # }

    Ests <- as.data.frame(Ests)
    names(Ests) <- c("SL50", "SL95", "FM", "SPR", "NLL")
    Ests$Year <- (length(Data@Year)-length(yrs)+1):length(Data@Year)

    Ests_smooth <- as.data.frame(Ests_smooth)
    names(Ests_smooth) <- c("SL50", "SL95", "FM", "SPR")
    Ests_smooth$Year <- (length(Data@Year)-length(yrs)+1):length(Data@Year)

    Ests_smooth <- rbind(Data@Misc[[x]]$Ests, Ests)
    Ests <-rbind(Data@Misc[[x]]$Ests, Ests)

    if (smoother) {
      SmoothEsts <- apply(Ests_smooth[,1:4], 2, FilterSmooth, R=R)
      Ests_smooth[,1:4] <- SmoothEsts
    }
  }

  return(list(Ests=Ests, Ests_smooth=Ests_smooth, Fit=Fit))
}

optimize_TMB <- function(obj, bounds, starts, restart=10) {

  step.min <- 1
  step.max <- 1
  control <- list(eval.max=1e4, iter.max=1e4,
                  step.min=step.min, step.max=step.max,
                  trace=0, abs.tol=1e-20)

  opt <- suppressWarnings(nlminb(starts, obj$fn, obj$gr,
                                          lower=bounds[[1]], upper=bounds[[2]],
                                          control=control))

  opt

  # opt <- optim(obj$par, obj$fn, obj$gr)
  # SD <- TMB::sdreport(obj, par.fixed=opt$par)

  # if(!SD$pdHess && restart > 0) {
  #
  #   # re-run with different starts
  #   obj$par <- starts * rnorm(length(opt$par), 0, 1e-3)
  #   optimize_TMB(obj, bounds, starts, restart=restart-1)
  #   # Recall(obj, bounds, starts, restart - 1)
  # } else {
  #   return(list(opt = opt, SD = SD))
  # }
}




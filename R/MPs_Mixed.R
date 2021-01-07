
## Mixed Management MPs ####

#' Itarget1 with an MPA
#'
#' A example mixed control MP that uses the Itarget1 output control MP together with a
#' spatial closure.
#'
#' The TAC is calculated as:
#' If  \eqn{I_\textrm{recent} \geq I_0}:
#' \deqn{\textrm{TAC}= 0.5 \textrm{TAC}^* \left[1+\left(\frac{I_\textrm{recent} - I_0}{I_\textrm{target} - I_0}\right)\right]}
#'
#' else:
#' \deqn{\textrm{TAC}= 0.5 \textrm{TAC}^* \left[\frac{I_\textrm{recent}}{I_0}^2\right]}
#'
#' where \eqn{I_0} is \eqn{0.8 I_{\textrm{ave}}} (the average index over the 2 x `yrsmth` years prior to the projection period),
#' \eqn{I_\textrm{recent}} is the average index over the past `yrsmth` years, and
#' \eqn{I_\textrm{target}} is `Imulti` times \eqn{I_{\textrm{ave}}},
#' and \eqn{\textrm{TAC}^*} is:
#' \deqn{(1-x)C}
#' where \eqn{x} is argument `xx` and C is the average catch over the last 5 years of the historical period.
#'
#' This mixed control MP also closes Area 1 to fishing.
#'
#' This MP has been included for demonstration purposes of a mixed control MP.
#'
#' @templateVar mp Itarget1_MPA
#' @template MPtemplate
#' @template MPuses
#'
#' @param yrsmth Years over which to smooth recent estimates of surplus
#' production
#' @param xx Parameter controlling the fraction of mean catch to start using in
#' first year
#' @param Imulti Parameter controlling how much larger target CPUE / index is
#' compared with recent levels.
#'
#' @export
#' @examples
#' Itarget1_MPA(1, MSEtool::Atlantic_mackerel, plot=TRUE)
#' @family Index methods
Itarget1_MPA <- function(x, Data, reps = 100, plot=FALSE, yrsmth = 5, xx = 0, Imulti = 1.5) {
  runItarget <- Itarget_(x, Data, reps, plot, yrsmth, xx, Imulti)
  Rec <- new("Rec")
  Rec@TAC <- MSEtool::TACfilter(runItarget$TAC)
  Rec@Spatial <- c(0, rep(1, Data@nareas-1))
  Rec
}
class(Itarget1_MPA) <- "MP"


#' Average Catch with a size limit
#'
#' A example mixed control MP that uses the average catch output control MP together with a
#' minimul size limit set at the size of maturity.
#'
#' The average catch method is very simple. The mean historical catch is calculated and used to set
#' a constant catch limit (TAC). If `reps` > 1 then the `reps` samples are drawn from a log-normal
#' distribution with mean `TAC` and standard deviation (in log-space) of 0.2.
#'
#' For completeness, the TAC is calculated by:
#'
#' \deqn{\textrm{TAC} =\frac{\sum_{y=1}^{\textrm{n}}{C_y}}{\textrm{n}}}
#'
#' where \eqn{\textrm{TAC}} is the the mean catch recommendation, \eqn{n} is the number of historical years, and
#' \eqn{C_y}  is the catch in historical year \eqn{y}.
#'
#' The size of retention is set to the length of maturity.
#'
#' This MP has been included for demonstration purposes of a mixed control MP.
#'
#' @templateVar mp AvC_MLL
#' @template MPtemplate
#' @template MPuses
#'
#' @export
#' @family Average Catch MPs
#'
#' @examples
#' Rec <- AvC_MLL(1, MSEtool::Cobia, reps=1000, plot=TRUE) # 1,000 log-normal samples with CV = 0.2
AvC_MLL <- function(x, Data, reps = 100, plot=FALSE) {
  if (length(Data@Year)<1 | is.na(Data@LHYear[1])) {
    Rec <- new("Rec")
    Rec@TAC <- rep(as.numeric(NA), reps)
    return(Rec)
  }
  yrs <- min(Data@Year):(Data@Year[Data@Year==Data@LHYear[1]])
  yr.ind <- match(yrs, Data@Year)
  histCatch <- Data@Cat[x, yr.ind]
  meanC <- mean(histCatch, na.rm = T)
  if (reps >1) {
    TAC <- rlnorm(reps, log(meanC), 0.2)
  } else {
    TAC <- meanC
  }
  Rec <- new("Rec")
  Rec@TAC <- TAC
  if (plot) AvC_plot(x, Data, Rec, meanC, histCatch, yr.ind, lwd=3, cex.lab=1.25)
  Rec@LR5 <- Data@L50[x] * 0.95 # new length at 5% retention
  Rec@LFR <-  Data@L50[x] # new length at full retention
  Rec
}
class(AvC_MLL) <- "MP"



.onAttach <- function(libname, pkgname) {
  banner <- .AttachMSEtool()
  if (is.null(banner) || isTRUE(getOption("openMSE.quiet"))) return(invisible())
  version <- as.character(utils::packageVersion("MSEtool"))
  packageStartupMessage(paste(c(
    cli::rule(left = cli::style_bold("Attaching packages"), width = 60),
    paste(cli::col_green(cli::symbol$tick), cli::col_blue("MSEtool"), version),
    "",
    banner
  ), collapse = "\n"))
}

# Attach MSEtool quietly and return its banner; NULL if it was already attached
.AttachMSEtool <- function() {
  pkg <- "MSEtool"
  if (paste0("package:", pkg) %in% search()) return(NULL)
  banner <- NULL
  withCallingHandlers(
    library(pkg, character.only = TRUE, warn.conflicts = FALSE),
    packageStartupMessage = function(m) {
      banner <<- trimws(conditionMessage(m), "right")
      invokeRestart("muffleMessage")
    }
  )
  banner
}

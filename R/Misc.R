
tiny <- 1E-15

#' Get help topic URL
#'
#' @param topic Name of the functions
#' @param url URL for the help documentation
#' @param nameonly Logical. Help file name only?
#'
#' @return file path to help file
#' @export
#'
#' @keywords internal
MPurl <- function(topic, url='https://blue-matter.github.io/DLMtool/reference/',
                  nameonly=FALSE) {

  paths <- file.path(.libPaths()[1], "DLMtool")

  res <- character()
  for (p in paths) {
    if (file.exists(f <- file.path(p, "help", "aliases.rds")))
      al <- readRDS(f)
    else if (file.exists(f <- file.path(p, "help", "AnIndex"))) {
      foo <- scan(f, what = list(a = "", b = ""), sep = "\t",
                  quote = "", na.strings = "", quiet = TRUE)
      al <- structure(foo$b, names = foo$a)
    }
    else next
    f <- al[topic]
    if (is.na(f))
      next
    res <- c(res, file.path(p, "help", f))

  }
  if (length(res)<1) return(NA)

  if(nameonly) {
    return(basename(res))
  } else{
    return(paste0(url, basename(res), ".html"))
  }

}

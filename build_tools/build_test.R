devtools::build('../DLMtool')

v <- as.character(packageVersion("DLMtool"))
nm <- paste0("DLMtool_", v, ".tar.gz")

shell(paste0("R CMD check ../", nm))


tt = devtools::spell_check()

tt

library(rhub)

validate_email()

cran_prep <- check_for_cran()
cran_prep$cran_summary()


devtools::release()

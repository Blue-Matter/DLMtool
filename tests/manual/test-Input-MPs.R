testthat::context("Test Input MPs")


library(DLMtool)

OM <- MSEtool::testOM

MPs <- avail('MP', 'DLMtool')

types <- MPtype(MPs)

MPs <- types$MP[types$Type == 'Input']

MSE <- runMSE(OM, MPs=MPs)

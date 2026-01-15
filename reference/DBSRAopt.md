# Internal optimization function

Internal optimization function

## Usage

``` r
DBSRAopt(lnK, C_hist, nys, Mdb, FMSY_M, BMSY_K, Bt_K, adelay, opt = 1)
```

## Arguments

- lnK:

  log unfished biomass

- C_hist:

  Historical catches

- nys:

  number of years (length of C_hist)

- Mdb:

  M

- FMSY_M:

  FMSY/M

- BMSY_K:

  BMSY/K

- Bt_K:

  Current depletion

- adelay:

  age of maturity

- opt:

  Numeric. 1 for optimization. 2 to return Biomass trend

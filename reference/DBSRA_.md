# Depletion-based SRA internal function

Depletion-based SRA internal function

## Usage

``` r
DBSRA_(x, Data, reps = 100, depo = NULL, hcr = NULL)
```

## Arguments

- x:

  iteration number

- Data:

  object of class Data

- reps:

  number of reps

- depo:

  Optional fixed depletion (single value)

- hcr:

  Optional harvest control rule for throttling catch as a function of
  B/B0. Numeric vector of length 2 specifying HCR break points - e.g
  c(0.4, 0.1) for 40-10 HCR

# Delay-Difference Internal Function

Delay-Difference Internal Function

## Usage

``` r
DD_(x, Data, reps = 100, hcr = NULL)
```

## Arguments

- x:

  iteration number

- Data:

  object of class Data

- reps:

  number of reps

- hcr:

  Optional harvest control rule for throttling catch as a function of
  B/B0. Numeric vector of length 2 specifying HCR break points - e.g
  c(0.4, 0.1) for 40-10 HCR

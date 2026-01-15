# Incremental Index Target MP Internal Function

Incremental Index Target MP Internal Function

## Usage

``` r
Itarget_(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xx = 0, Imulti = 1.5)
```

## Arguments

- x:

  Iteration number

- Data:

  An object of class `Data`

- reps:

  Number of replicates

- plot:

  Logical. Show the plot?

- yrsmth:

  Years over which the average index is calculated.

- xx:

  Parameter controlling the fraction of mean catch to start using in
  first year

- Imulti:

  Parameter controlling how much larger target CPUE / index is compared
  with recent levels.

## Value

A named list with TAC of length `reps`

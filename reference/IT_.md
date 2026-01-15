# Index Target Internal Function

Index Target Internal Function

## Usage

``` r
IT_(x, Data, reps = 100, plot = FALSE, yrsmth = 5, mc = 0.05)
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

  The number of historical years over which to average the index

- mc:

  The maximum fractional change in the TAC among years.

## Value

A named list with TAC recommendations of length `reps`

# Depletion Corrected Average Catch

Internal code to calculate dcac

## Usage

``` r
DCAC_(x, Data, reps = 100, Bt_K = NULL, updateD = FALSE)
```

## Arguments

- x:

  Simulation number

- Data:

  An object of class `Data`

- reps:

  The number of reps

- Bt_K:

  Optional value of depletion (otherwise taken from Data object)

- updateD:

  Logical. Should depletion be updated in projection years?

## Value

A list with dcac, Bt_K, and BMSY_K

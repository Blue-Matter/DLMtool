# Internal function for YPR MPs

Internal function for YPR MPs

## Usage

``` r
YPR_(x, Data, reps = 100, Abun = NULL)

YPRopt(Linfc, Kc, t0c, Mdb, a, b, LFS, maxage, reps = 100)
```

## Arguments

- x:

  Iteration number

- Data:

  Object of class Data

- reps:

  Number of reps

- Abun:

  Optional numeric of length `reps` of abundance

- Linfc:

  von Bertalanffy Linf

- Kc:

  von Bertalanffy K

- t0c:

  von Bertalanffy t0

- a:

  alpha parameter of L-W relationship

- b:

  beta parameter of L-W relationship

- LFS:

  Length at full selection

- maxage:

  Maximum age

## Functions

- `YPR_()`: Internal function for YPR MPs

- `YPRopt()`: YPR calculation function

## Note

Yield per recruit estimate of FMSY Meaghan Bryan 2013

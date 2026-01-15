# Surplus Production Stock Reduction Analysis

A surplus production equivalent of DB-SRA that uses a demographically
derived prior for intrinsic rate of increase (McAllister method, below)

## Usage

``` r
SPSRA(x, Data, reps = 100, plot = FALSE)

SPSRA_ML(x, Data, reps = 100, plot = FALSE)
```

## Arguments

- x:

  A position in the data object

- Data:

  A data object

- reps:

  The number of stochastic samples of the MP recommendation(s)

- plot:

  Logical. Show the plot?

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

The TAC is calculated as: \$\$\textrm{TAC} = K D \frac{r}{2}\$\$ where
\\K\\ is estimated unfished biomass, \\D\\ is depletion, and \\r\\ is
the estimated intrinsic rate of increase.

Like all SRA methods, this MP requires a time-series of catch extending
from the beginning of exploitation.

## Functions

- `SPSRA()`: Base version. Requires an estimate of current depletion

- `SPSRA_ML()`: Variant that uses a mean-length mortality estimator to
  obtain a prior for current stock depletion.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`SPSRA`: Cat, Dep, FMSY_M, L50, MaxAge, Mort, steep, vbK, vbLinf, vbt0,
wla, wlb

`SPSRA_ML`: CAL, Cat, Dep, FMSY_M, L50, Lbar, Lc, MaxAge, Mort, steep,
vbK, vbLinf, vbt0, wla, wlb, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/SPSRA.html) for
correctly rendered equations

## References

McAllister, M.K., Pikitch, E.K., and Babcock, E.A. 2001. Using
demographic methods to construct Bayesian priors for the intrinsic rate
of increase in the Schaefer model and implications for stock rebuilding.
Can. J. Fish. Aquat. Sci. 58: 1871-1890.

## See also

Other Surplus production MPs: [`Fadapt()`](Fadapt.md),
[`Rcontrol()`](Rcontrol.md), [`SPMSY()`](SPMSY.md),
[`SPmod()`](SPmod.md), [`SPslope()`](SPslope.md)

## Author

T. Carruthers

## Examples

``` r
SPSRA(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1074.187 
SPSRA_ML(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     3989.192 
```

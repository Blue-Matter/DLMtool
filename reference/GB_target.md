# Geromont and Butterworth target CPUE and catch MP

An MP similar to SBT2 that modifies a time-series of catch
recommendations and aims for target catch rate and catch level based on
BMSY/B0 and MSY, respectively.

## Usage

``` r
GB_target(x, Data, reps = 100, plot = FALSE, w = 0.5)
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

- w:

  A gain parameter

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

The TAC is calculated as: If \\I\_\textrm{recent} \geq I_0\\:
\$\$\textrm{TAC}= C\_\textrm{ref} \left(w +
(1-w)\frac{I\_\textrm{rec}-I_0}{I\_\textrm{target}-I_0} \right) \$\$

else: \$\$\textrm{TAC}= wC\_\textrm{ref}
\frac{I\_\textrm{rec}}{I_0}^2\$\$

where \\C\_\textrm{ref}\\ is a reference catch assumed to be a proxy for
MSY (`Data@Cref`), *w* is a gain parameter, \\I\_\textrm{rec}\\ is the
average index over the last 4 years, \\I\_\textrm{target}\\ is the
target Index (`Data@Iref`), and \\I_0\\ is 0.2 x the average index over
the past 5 years.

In the MSE \\C\_\textrm{ref}\\ is the calculated MSY subject to
observation error defined in `Obs@CV_Cref`, and \\I\_\textrm{target}\\
is assumed to be the index at MSY subject to observation error
(`Obs@CV_Iref`). Consequently, the performance of this method in the MSE
is strongly determined by the specified uncertainty for these
parameters.

The TAC is subject to the following conditions:

1.  if next TAC \> 1.2 last catch, then TAC = 1.2 last catch

2.  if next TAC \< 0.8 last catch, then TAC = 0.8 last catch

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`GB_target`: Cref, Ind, Iref

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/GB_target.html) for
correctly rendered equations

## References

Geromont, H.F. and Butterworth, D.S. 2014. Complex assessment or simple
management procedures for efficient fisheries management: a comparative
study. ICES J. Mar. Sci. doi:10.1093/icesjms/fsu017

## See also

Other Index methods: [`GB_slope()`](GB_slope.md),
[`Gcontrol()`](Gcontrol.md), [`ICI()`](ICI.md), [`Iratio()`](Iratio.md),
[`Islope1()`](Islope1.md), [`Itarget1()`](Itarget1.md),
[`Itarget1_MPA()`](Itarget1_MPA.md), [`ItargetE1()`](ItargetE1.md)

## Author

T. Carruthers

## Examples

``` r
 GB_target(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1733.747 
```

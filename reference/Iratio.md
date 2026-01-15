# Mean Index Ratio

The TAC is adjusted by the ratio alpha, where the numerator being the
mean index in the most recent two years of the time series and the
denominator being the mean index in the three years prior to those in
the numerator. This MP is the stochastic version of Method 3.2 used by
ICES for Data-Limited Stocks (ICES 2012).

## Usage

``` r
Iratio(x, Data, reps = 100, plot = FALSE, yrs = c(2, 5))
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

- yrs:

  Vector of length 2 specifying the reference years

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

The TAC is calculated as: \$\$\textrm{TAC}\_y = \alpha C\_{y-1}\$\$
where \\C\_{y-1}\\ is the catch from the previous year, and \\\alpha\\
is the ratio of the mean index in the most recent two years of the time
series and the mean index in 3-5 years before current time (reference
years are specified as `yrs` argument.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`Iratio`: Cat, Ind

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/Iratio.html) for
correctly rendered equations

## References

Ernesto Jardim, Manuela Azevedo, Nuno M. Brites, Harvest control rules
for data limited stocks using length-based reference points and survey
biomass indices, Fisheries Research, Volume 171, November 2015, Pages
12-19, ISSN 0165-7836, https://doi.org/10.1016/j.fishres.2014.11.013

ICES. 2012. ICES Implementation of Advice for Data-limited Stocks in
2012 in its 2012 Advice. ICES CM 2012/ACOM 68. 42 pp.

## See also

Other Index methods: [`GB_slope()`](GB_slope.md),
[`GB_target()`](GB_target.md), [`Gcontrol()`](Gcontrol.md),
[`ICI()`](ICI.md), [`Islope1()`](Islope1.md),
[`Itarget1()`](Itarget1.md), [`Itarget1_MPA()`](Itarget1_MPA.md),
[`ItargetE1()`](ItargetE1.md)

## Author

Coded by Q. Huynh. Developed by Jardim et al. (2015)

## Examples

``` r
Iratio(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>     9.341731 
```

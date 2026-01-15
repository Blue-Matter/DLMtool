# G-control MP

A harvest control rule proposed by Carl Walters that uses trajectory in
inferred surplus production to make upward/downward adjustments to TAC
recommendations

## Usage

``` r
Gcontrol(
  x,
  Data,
  reps = 100,
  plot = FALSE,
  yrsmth = 10,
  gg = 2,
  glim = c(0.5, 2)
)
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

- yrsmth:

  The number of years over which to smooth catch and biomass data

- gg:

  A gain parameter

- glim:

  A constraint limiting the maximum level of change in quota
  recommendations

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

The TAC is calculated as: \$\$\textrm{TAC} = \textrm{SP}
\left(1-gG\right)\$\$ where \\\textrm{SP}\\ is the predicted surplus
production for the next year, *g* is a gain parameter, and *G* is the
slope of surplus production as a function of biomass over the last
`yrsmth` years.

The change in TAC is bounded by the `glim` argument, which by default
does not allow the TAC to decrease by more than half or increase more
than twice the last annual catch.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`Gcontrol`: Abun, Cat, Ind, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/Gcontrol.html) for
correctly rendered equations

## References

Carruthers et al. 2015. Performance evaluation of simple management
procedures. ICES J. Mar Sci. 73, 464-482.

## See also

Other Index methods: [`GB_slope()`](GB_slope.md),
[`GB_target()`](GB_target.md), [`ICI()`](ICI.md),
[`Iratio()`](Iratio.md), [`Islope1()`](Islope1.md),
[`Itarget1()`](Itarget1.md), [`Itarget1_MPA()`](Itarget1_MPA.md),
[`ItargetE1()`](ItargetE1.md)

## Author

C. Walters and T. Carruthers

## Examples

``` r
Gcontrol(1, Data=MSEtool::Atlantic_mackerel, plot=TRUE)
#> Error in if (all(round(TAC/mean(TAC, na.rm = TRUE), 1) == 1)) {    points(max(years), mean(TAC, na.rm = TRUE), pch = 16, cex = 2,         col = "blue")    text(max(years), mean(TAC, na.rm = TRUE), "TAC", pos = 1,         col = "blue")} else {    boxplot(TAC, add = TRUE, at = max(years), col = "blue", width = 1,         outline = TRUE, axes = FALSE)    text(max(years), quantile(TAC, 0.95, na.rm = TRUE), "TAC",         pos = 3, col = "blue")}: missing value where TRUE/FALSE needed
```

# Index Confidence Interval

The MP adjusts catch based on the value of the index in the current year
relative to the time series mean and standard error.

## Usage

``` r
ICI(x, Data, reps = 100, plot = FALSE)

ICI2(x, Data, reps = 100, plot = FALSE)
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

The TAC is calculated as: \$\$\textrm{TAC}\_y=C\_{y-1} \alpha\$\$ where
\\C\_{y-1}\\ is the catch from the previous year, and \\\alpha\\ is
defined as: \$\$\alpha = \left\\\begin{array}{ll} d & \textrm{if } I \<
\textrm{CI}\_L \\ u & \textrm{if } I \> \textrm{CI}\_H \\ 1 & \textrm{if
} \textrm{CI}\_L \leq I \leq \textrm{CI}\_H \\ \end{array}\right. \$\$
where \\I\\ is the index in the most recent year, \\d\\ is 0.75 for
`ICI` and `ICI2`, \\u\\ is 1.05 and 1.25 for`ICI` and `ICI2`
respectively, and \\\textrm{CI}\_L\\ and \\\textrm{CI}\_L\\ are the
lower and upper bound of the confidence interval of mean historical
index. The confidence interval is calculated using Z-scores described in
the Functions section below.

## Functions

- `ICI()`: The catch is reduced by 0.75 if the Z-score of the current
  year's index is less than -0.44. The catch is increased by 1.05 if the
  Z-score of the current year's index is greater than 1.96. Otherwise,
  the catch is held constant.

- `ICI2()`: This method is less precautionary of the two ICI MPs by
  allowing for a larger increase in TAC and a lower threshold of the
  index to decrease the TAC. The catch is reduced by 0.75 if the Z-score
  of the current year's index is less than -1.96. The catch is increased
  by 1.25 if the Z-score of the current year's index is greater than
  1.96. Otherwise, the catch is held constant.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`ICI`: Cat, Ind

`ICI2`: Cat, Ind

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/ICI.html) for
correctly rendered equations

## References

Ernesto Jardim, Manuela Azevedo, Nuno M. Brites, Harvest control rules
for data limited stocks using length-based reference points and survey
biomass indices, Fisheries Research, Volume 171, November 2015, Pages
12-19, ISSN 0165-7836, https://doi.org/10.1016/j.fishres.2014.11.013

## See also

Other Index methods: [`GB_slope()`](GB_slope.md),
[`GB_target()`](GB_target.md), [`Gcontrol()`](Gcontrol.md),
[`Iratio()`](Iratio.md), [`Islope1()`](Islope1.md),
[`Itarget1()`](Itarget1.md), [`Itarget1_MPA()`](Itarget1_MPA.md),
[`ItargetE1()`](ItargetE1.md)

## Author

Coded by Q. Huynh. Developed by Jardim et al. (2015)

## Examples

``` r
ICI(1, Data=MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>     13.44202 

ICI2(1, Data=MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>     13.60642 
```

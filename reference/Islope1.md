# Index Slope Tracking MP

A management procedure that incrementally adjusts the TAC to maintain a
constant CPUE or relative abundance index.

## Usage

``` r
Islope1(x, Data, reps = 100, plot = FALSE, yrsmth = 5, lambda = 0.4, xx = 0.2)

Islope2(x, Data, reps = 100, plot = FALSE, yrsmth = 5, lambda = 0.4, xx = 0.3)

Islope3(x, Data, reps = 100, plot = FALSE, yrsmth = 5, lambda = 0.4, xx = 0.4)

Islope4(x, Data, reps = 100, plot = FALSE, yrsmth = 5, lambda = 0.2, xx = 0.4)
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

  Years over which to calculate index

- lambda:

  A gain parameter controlling the speed in update in TAC.

- xx:

  Parameter controlling the fraction of mean catch to start using in
  first year

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

The TAC is calculated as: \$\$\textrm{TAC} = \textrm{TAC}^\*
\left(1+\lambda I \right)\$\$ where \\\textrm{TAC}^\*\\ is \\1-xx\\
multiplied by the mean catch from the past `yrsmth` years for the first
year and catch from the previous year in projection years, \\\lambda\\
is a gain parameter, and \\I\\ is the slope of log index over the past
`yrsmth` years.

## Functions

- `Islope1()`: The least biologically precautionary of the Islope
  methods

- `Islope2()`: More biologically precautionary. Reference TAC is 0.7
  average catch

- `Islope3()`: More biologically precautionary. Reference TAC is 0.6
  average catch

- `Islope4()`: The most biologically precautionary of the Islope
  methods. Reference TAC is 0.6 average catch and gain parameter is 0.2

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`Islope1`: Cat, Ind, LHYear, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/Islope1.html) for
correctly rendered equations

## References

Carruthers et al. 2015. Performance evaluation of simple management
procedures. ICES J. Mar Sci. 73, 464-482.

Geromont, H.F., Butterworth, D.S. 2014. Generic management procedures
for data-poor fisheries; forecasting with few data. ICES J. Mar. Sci.
doi:10.1093/icesjms/fst232

## See also

Other Index methods: [`GB_slope()`](GB_slope.md),
[`GB_target()`](GB_target.md), [`Gcontrol()`](Gcontrol.md),
[`ICI()`](ICI.md), [`Iratio()`](Iratio.md), [`Itarget1()`](Itarget1.md),
[`Itarget1_MPA()`](Itarget1_MPA.md), [`ItargetE1()`](ItargetE1.md)

## Author

T. Carruthers

## Examples

``` r
Islope1(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>      1650.62 
Islope2(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1622.748 
Islope3(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1649.048 
Islope4(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1677.654 
```

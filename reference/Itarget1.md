# Incremental Index Target MP

A management procedure that incrementally adjusts the TAC (starting from
reference level that is a fraction of mean recent catches) to reach a
target CPUE / relative abundance index

## Usage

``` r
Itarget1(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xx = 0, Imulti = 1.5)

Itarget2(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xx = 0, Imulti = 2)

Itarget3(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xx = 0, Imulti = 2.5)

Itarget4(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xx = 0.3, Imulti = 2.5)
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

  Years over which the average index is calculated.

- xx:

  Parameter controlling the fraction of mean catch to start using in
  first year

- Imulti:

  Parameter controlling how much larger target CPUE / index is compared
  with recent levels.

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

Four index/CPUE target MPs proposed by Geromont and Butterworth 2014.
Tested by Carruthers et al. 2015.

The TAC is calculated as: If \\I\_\textrm{recent} \geq I_0\\:
\$\$\textrm{TAC}= 0.5 \textrm{TAC}^\*
\left\[1+\left(\frac{I\_\textrm{recent} - I_0}{I\_\textrm{target} -
I_0}\right)\right\]\$\$

else: \$\$\textrm{TAC}= 0.5 \textrm{TAC}^\*
\left\[\frac{I\_\textrm{recent}}{I_0}^2\right\]\$\$

where \\I_0\\ is \\0.8 I\_{\textrm{ave}}\\ (the average index over the 2
x `yrsmth` years prior to the projection period), \\I\_\textrm{recent}\\
is the average index over the past `yrsmth` years, and
\\I\_\textrm{target}\\ is `Imulti` times \\I\_{\textrm{ave}}\\, and
\\\textrm{TAC}^\*\\ is: \$\$(1-x)C\$\$ where \\x\\ is argument `xx` and
C is the average catch over the last 5 years of the historical period.

## Functions

- `Itarget1()`: The less precautionary TAC-based MP

- `Itarget2()`: Increasing biologically precautionary TAC-based MP

- `Itarget3()`: Increasing biologically precautionary TAC-based MP

- `Itarget4()`: The most biologically precautionary TAC-based MP

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`Itarget1`: Cat, Ind, LHYear, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/Itarget1.html) for
correctly rendered equations

## References

Carruthers et al. 2015. Performance evaluation of simple management
procedures. ICES J. Mar Sci. 73, 464-482.

Geromont, H.F., Butterworth, D.S. 2014. Generic management procedures
for data-poor fisheries; forecasting with few data. ICES J. Mar. Sci.
72, 251-261. doi:10.1093/icesjms/fst232

## See also

Other Index methods: [`GB_slope()`](GB_slope.md),
[`GB_target()`](GB_target.md), [`Gcontrol()`](Gcontrol.md),
[`ICI()`](ICI.md), [`Iratio()`](Iratio.md), [`Islope1()`](Islope1.md),
[`Itarget1_MPA()`](Itarget1_MPA.md), [`ItargetE1()`](ItargetE1.md)

## Author

T. Carruthers

## Examples

``` r
Itarget1(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>     7.025526 
Itarget2(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>      7.02446 
Itarget3(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>     7.158908 
Itarget4(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> TAC (median) 
#>     4.950853 
```

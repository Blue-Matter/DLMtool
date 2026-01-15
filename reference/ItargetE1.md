# Incremental Index Target MP - Effort-Based

A management procedure that incrementally adjusts the fishing effort to
reach a target CPUE / relative abundance index

## Usage

``` r
ItargetE1(x, Data, reps = 100, plot = FALSE, yrsmth = 5, Imulti = 1.5)

ItargetE2(x, Data, reps = 100, plot = FALSE, yrsmth = 5, Imulti = 2)

ItargetE3(x, Data, reps = 100, plot = FALSE, yrsmth = 5, Imulti = 2.5)

ItargetE4(x, Data, reps = 100, plot = FALSE, yrsmth = 5, Imulti = 2.5)
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

- Imulti:

  Parameter controlling how much larger target CPUE / index is compared
  with recent levels.

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the TAE slot(s) populated

## Details

Four index/CPUE target MPs proposed by Geromont and Butterworth 2014.

The TAE is calculated as: If \\I\_\textrm{recent} \geq I_0\\:
\$\$\textrm{TAE}\_y = 0.5 \textrm{TAE}\_{y-1} \left\[1+ \left(
\frac{I\_{\textrm{recent}} - I_0}{I\_{\textrm{target}} - I_0}
\right)\right\]\$\$

else: \$\$\textrm{TAE}\_y= 0.5 \textrm{TAE}\_{y-1} \left(
\frac{I\_{\textrm{recent}}}{I_0}^2 \right)\$\$

where \\I_0\\ is \\0.8 I\_{\textrm{ave}}\\ (the average index over the 2
x `yrsmth` years prior to the projection period), \\I\_\textrm{recent}\\
is the average index over the past `yrsmth` years, and
\\I\_\textrm{target}\\ is `Imulti` times \\I\_{\textrm{ave}}\\.

## Functions

- `ItargetE1()`: The less precautionary TAE-based MP

- `ItargetE2()`: Increasing biologically precautionary TAE-based MP

- `ItargetE3()`: Increasing biologically precautionary TAE-based MP

- `ItargetE4()`: The most biologically precautionary TAE-based MP

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`ItargetE1`: Ind, LHYear, MPeff, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/ItargetE1.html) for
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
[`Itarget1()`](Itarget1.md), [`Itarget1_MPA()`](Itarget1_MPA.md)

## Author

T. Carruthers

## Examples

``` r
ItargetE1(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> Effort 
#>   0.85 
ItargetE2(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> Effort 
#>   0.85 
ItargetE3(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> Effort 
#>   0.85 
ItargetE4(1, MSEtool::Atlantic_mackerel, plot=TRUE)
#> Effort 
#>   0.85 
```

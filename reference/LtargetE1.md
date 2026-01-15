# Length Target TAE MP

A management procedure that incrementally adjusts the TAE to reach a
target mean length in catches.

## Usage

``` r
LtargetE1(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xL = 1.05)

LtargetE4(x, Data, reps = 100, plot = FALSE, yrsmth = 5, xL = 1.15)
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

  Years over which to calculate mean length

- xL:

  Parameter controlling the magnitude of the target mean length of
  catches relative to average length in catches.

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the TAE slot(s) populated

## Details

Four target length MPs proposed by Geromont and Butterworth 2014. Tested
by Carruthers et al. 2015.

The TAE is calculated as:

If \\L\_\textrm{recent} \geq L_0\\: \$\$\textrm{TAE} = 0.5
\textrm{TAE}^\*
\left\[1+\left(\frac{L\_\textrm{recent}-L_0}{L\_\textrm{target}-L_0}\right)\right\]
\$\$

else: \$\$\textrm{TAE} = 0.5 \textrm{TAE}^\*
\left\[\frac{L\_\textrm{recent}}{L_0}^2\right\] \$\$

where \\\textrm{TAE}^\*\\ is the effort in the previous year,
\\L\_\textrm{recent}\\ is mean length in last `yrmsth` years, \\L_0\\ is
(except for `L95target`) 0.9 average catch in the last 2 x `yrsmth`
historical (pre-projection years) (\\L\_\textrm{ave}\\), and
\\L\_\textrm{target}\\ is (except for `L95target`) `xL`
\\L\_\textrm{ave}\\.

## Functions

- `LtargetE1()`: The least biologically precautionary TAE-based MP.

- `LtargetE4()`: The `xL` argument is increased to 1.15.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`LtargetE1`: LHYear, ML, MPeff, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/LtargetE1.html) for
correctly rendered equations

## References

Carruthers et al. 2015. Performance evaluation of simple management
procedures. ICES J. Mar Sci. 73, 464-482.

Geromont, H.F., Butterworth, D.S. 2014. Generic management procedures
for data-poor fisheries; forecasting with few data. ICES J. Mar. Sci.
doi:10.1093/icesjms/fst232

## See also

Other Length target MPs: [`Lratio_BHI()`](Lratio_BHI.md),
[`Ltarget1()`](Ltarget1.md)

## Author

T. Carruthers

## Examples

``` r
LtargetE1(1, Data=MSEtool::SimulatedData, plot=TRUE)

#> Effort 
#>   0.85 
LtargetE4(1, Data=MSEtool::SimulatedData, plot=TRUE)

#> Effort 
#>   0.85 
```

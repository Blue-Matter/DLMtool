# Geromont and Butterworth Constant Catch Harvest Control Rule

A simple MP that aims for a reference catch (as a proxy for MSY) subject
to imperfect information.

## Usage

``` r
GB_CC(x, Data, reps = 100, plot = FALSE)
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

Note that this is my interpretation of their MP and is now stochastic.
Currently it is generalized and is not 'tuned' to more detailed
assessment data which might explain why in some cases it leads to stock
declines.

The TAC is calculated as: \$\$\textrm{TAC} = C\_\textrm{ref}\$\$ where
\\C\_\textrm{ref}\\ is a reference catch assumed to be a proxy for MSY.
In the MSE \\C\_\textrm{ref}\\ is the calculated MSY subject to
observation error defined in `Obs@CV_Cref`.

The TAC is subject to the following conditions:

1.  if next TAC \> 1.2 last catch, then TAC = 1.2 last catch

2.  if next TAC \< 0.8 last catch, then TAC = 0.8 last catch

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`GB_CC`: Cref

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/GB_CC.html) for
correctly rendered equations

## References

Geromont, H.F. and Butterworth, D.S. 2014. Complex assessment or simple
management procedures for efficient fisheries management: a comparative
study. ICES J. Mar. Sci. doi:10.1093/icesjms/fsu017

## See also

Other Constant Catch MPs: [`CC1()`](CC1.md)

## Author

T. Carruthers

## Examples

``` r
GB_CC(1, MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1668.429 
```

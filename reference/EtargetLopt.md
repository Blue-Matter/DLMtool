# Effort Target Optimum Length

This MP adjusts effort limit based on the ratio of recent mean length
(over last `yrsmth` years) and a target length defined as
\\L\_{\textrm{opt}}\\. Effort MP: adjust effort up/down if mean length
above/below Ltarget

## Usage

``` r
EtargetLopt(x, Data, reps = 100, plot = FALSE, yrsmth = 3, buffer = 0.1)
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

  Number of years to calculate average length

- buffer:

  Parameter controlling the fraction of calculated effor - acts as a
  precautionary buffer

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the TAE slot(s) populated

## Details

The TAE is calculated as: \$\$\textrm{TAE}\_y = \textrm{TAE}\_{y-1}
\left((1-\textrm{buffer}) (w + (1-w)r) \right)\$\$ where
\\\textrm{buffer}\\ is specified in argument `buffer`, \\w\\ is fixed at
0.5, and: \$\$r = \frac{L\_{\textrm{recent}}}{L\_{\textrm{opt}}}\$\$
where \\L\_{\textrm{recent}}\\is mean length over last `yrmsth` years,
and: \$\$L\_{\textrm{opt}} = \frac{L\_\infty W_b}{\frac{M}{K} + W_b
}\$\$ where \\L\_\infty\\ is von Bertalanffy asymptotic length, \\W_b\\
is exponent of the length-weight relationship, \\M\\ is natural
mortality, and \\K\\ is von Bertalanffy growth coefficient.#'

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`EtargetLopt`: ML, Mort, MPeff, vbK, vbLinf, wlb, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/EtargetLopt.html)
for correctly rendered equations

## Author

HF Geromont

## Examples

``` r
EtargetLopt(1, MSEtool::SimulatedData, plot=TRUE)

#>    Effort 
#> 0.8003528 
```

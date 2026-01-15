# Index Target based on natural mortality rate

An index target MP where the TAC is modified according to current index
levels (mean index over last number of years determined by natural
mortality (*M*)) relative to a target level.

## Usage

``` r
ITM(x, Data, reps = 100, plot = FALSE)
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

The TAC is caluclated as: \$\$\textrm{TAC}\_y = \textrm{TAC}\_{y-1}
\delta I\$\$ where \\\delta I\\ is the ratio of the mean index over
\\4\frac{1}{M}^{1/4}\\ years to the reference index (`Data@Iref`).

The maximum fractional change in TAC is determined by \\mc\\, defined as
\\mc = \textrm{max}\left(\frac{5 + 25M}{100}, 0.2\right)\\

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`ITM`: Ind, Iref, Mort, MPrec

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/ITM.html) for
correctly rendered equations

## Author

T. Carruthers

## Examples

``` r
ITM(1, Data=MSEtool::SimulatedData, plot=TRUE)

#> TAC (median) 
#>     1942.567 
```

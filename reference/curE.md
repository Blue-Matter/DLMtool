# Fishing at current effort levels

Constant fishing effort set at final year of historical simulations
subject to changes in catchability determined by `OM@qinc` and
interannual variability in catchability determined by `OM@qcv`. This MP
is intended to represent a 'status quo' management approach.

## Usage

``` r
curE(x, Data, reps, plot = FALSE)

curE75(x, Data, reps, plot = FALSE)
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
the TAE slot(s) populated

## Functions

- `curE()`: Set effort to 100\\

- `curE75()`: Set effort to 75\\

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`curE`:

`curE75`:

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/curE.html) for
correctly rendered equations

## Author

T. Carruthers.

## Examples

``` r
curE(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> Effort 
#>      1 
curE75(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> Effort 
#>   0.75 
```

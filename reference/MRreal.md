# Spatial closure and allocation management procedures

Management procedures that close Area 1 to fishing and reallocate
fishing effort spatially.

## Usage

``` r
MRreal(x, Data, reps, plot = FALSE)

MRnoreal(x, Data, reps, plot = FALSE)
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
the Spatial slot(s) populated

## Functions

- `MRreal()`: A spatial control that prevents fishing in area 1 and
  reallocates this fishing effort to area 2 (or over other areas).

- `MRnoreal()`: A spatial control that prevents fishing in area 1 and
  does not reallocate this fishing effort to area 2.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`MRreal`:

`MRnoreal`:

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/MRreal.html) for
correctly rendered equations

## Author

T. Carruthers

## Examples

``` r
MRreal(1, MSEtool::Atlantic_mackerel, plot=TRUE)

#> Area 1 Area 2 
#>      0      1 
MRnoreal(1, MSEtool::Atlantic_mackerel, plot=TRUE)
#> Area 1 Area 2 
#>      0      1 
```

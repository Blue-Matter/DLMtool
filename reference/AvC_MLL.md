# Average Catch with a size limit

A example mixed control MP that uses the average catch output control MP
together with a minimul size limit set at the size of maturity.

## Usage

``` r
AvC_MLL(x, Data, reps = 100, plot = FALSE)
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
the TAC, Retention slot(s) populated

## Details

The average catch method is very simple. The mean historical catch is
calculated and used to set a constant catch limit (TAC). If `reps` \> 1
then the `reps` samples are drawn from a log-normal distribution with
mean `TAC` and standard deviation (in log-space) of 0.2.

For completeness, the TAC is calculated by:

\$\$\textrm{TAC} =\frac{\sum\_{y=1}^{\textrm{n}}{C_y}}{\textrm{n}}\$\$

where \\\textrm{TAC}\\ is the the mean catch recommendation, \\n\\ is
the number of historical years, and \\C_y\\ is the catch in historical
year \\y\\.

The size of retention is set to the length of maturity.

This MP has been included for demonstration purposes of a mixed control
MP.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`AvC_MLL`: Cat, LHYear, Year

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/AvC_MLL.html) for
correctly rendered equations

## See also

Other Average Catch MPs: [`AvC()`](AvC.md), [`DCACs()`](DCAC.md)

## Examples

``` r
Rec <- AvC_MLL(1, MSEtool::Cobia, reps=1000, plot=TRUE) # 1,000 log-normal samples with CV = 0.2
```

# Beddington and Kirkwood life-history MP

Family of management procedures that sets the TAC by approximation of
Fmax based on the length at first capture relative to asymptotic length
and the von Bertalanffy growth parameter *K*.

## Usage

``` r
BK(x, Data, reps = 100, plot = FALSE)

BK_CC(x, Data, reps = 100, plot = FALSE, Fmin = 0.005)

BK_ML(x, Data, reps = 100, plot = FALSE)
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

- Fmin:

  The minimum fishing mortality rate that is derived from the
  catch-curve (interval censor).

## Value

An object of class
[`Rec-class`](https://msetool.openmse.com/reference/Rec-class.html) with
the `TAC` slot populated with a numeric vector of length `reps`

## Details

The TAC is calculated as: \$\$\textrm{TAC} = A F\_{\textrm{max}}\$\$
where \\A\\ is (vulnerable) stock abundance, and \\F\_{\textrm{max}}\\
is calculated as: \$\$F\_{\textrm{max}} =
\frac{0.6K}{0.67-L_c/L\_\infty}\$\$ where \\K\\ is the von Bertalanffy
growth coefficient, \\L_c\\ is the length at first capture, and
\\L\_\infty\\ is the von Bertalanffy asymptotic length

Abundance (*A*) is either assumed known (`BK`) or estimated (`BK_CC` and
`BK_ML`): \$\$A = \frac{\bar{C}}{\left(1-e^{-F}\right)}\$\$ where
\\\bar{C}\\ is the mean catch, and *F* is estimated. See Functions
section below for the estimation of *F*.

## Functions

- `BK()`: Assumes that abundance is known, i.e. `Data@Abun` and
  `Data@CV_abun` contain values

- `BK_CC()`: Abundance is estimated using an age-based catch curve to
  estimate *Z* and *F*, and abundance estimated from recent catches and
  *F*.

- `BK_ML()`: Abundance is estimated using mean length to estimate *Z*
  and *F*, and abundance estimated from recent catches and *F*.

## Note

Note that the Beddington-Kirkwood method is designed to estimate
\\F\_\textrm{max}\\, that is, the fishing mortality that produces the
maximum yield *assuming constant recruitment independent of spawning
biomass*.

Beddington and Kirkwood (2005) recommend estimating *F* using other
methods (e.g., a catch curve) and comparing the estimated *F* to the
estimated \\F\_\textrm{max}\\ and adjusting exploitation accordingly.
These MPs have not been implemented that way.

## Required Data

See
[`Data-class`](https://msetool.openmse.com/reference/Data-class.html)
for information on the `Data` object  

`BK`: Abun, LFC, vbK, vbLinf

`BK_CC`: CAA, Cat, LFC, vbK, vbLinf

`BK_ML`: CAL, Cat, Lbar, Lc, LFC, Mort, vbK, vbLinf

## Rendered Equations

See [Online
Documentation](https://dlmtool.openmse.com/reference/BK.html) for
correctly rendered equations

## References

Beddington, J.R., Kirkwood, G.P., 2005. The estimation of potential
yield and stock status using life history parameters. Philos. Trans. R.
Soc. Lond. B Biol. Sci. 360, 163-170.

## Author

T. Carruthers.

## Examples

``` r
if (FALSE) { # \dontrun{
BK(1, MSEtool::SimulatedData, reps=1000, plot=TRUE)
} # }

if (FALSE) { # \dontrun{
BK_CC(1, MSEtool::SimulatedData, reps=1000, plot=TRUE)
} # }

if (FALSE) { # \dontrun{
BK_ML(1, MSEtool::SimulatedData, reps=100, plot=TRUE)
} # }
```

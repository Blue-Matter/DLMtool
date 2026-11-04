# DLMtool

The Data-Limited Methods toolkit (`DLMtool`) is a library of over 100
data-limited management procedures (MPs) for use in fisheries management
strategy evaluation (MSE). It is part of the
[openMSE](https://openMSE.com) collection of R packages.

## Key Features

- **Large MP library**: output control (TAC), input control (effort,
  size limits, spatial closures), and mixed-control MPs, ranging from
  simple catch-based rules to model-based estimators
- **Works with `MSEtool` v4.0+**: legacy MPs run directly against
  `data`-class objects produced by `MSEtool`’s current `om`/`data`
  simulation engine, via automatic object conversion
  ([`MSEtool::Convert()`](https://msetool.openmse.com/reference/Convert.html))
- **Works with the legacy engine**: MPs remain fully compatible with the
  original `OM`/`Data` classes for existing workflows
- **Plain R functions**: every MP is a function that accepts a `Data`
  object and returns a `Rec` (recommendation) object, so new MPs are
  easy to write and test
- **Diagnostic tools**: functions for checking MP behaviour and data
  requirements before running a full MSE

Not every legacy MP maps cleanly onto the new engine: a small number
rely on legacy-only `Data` slots (e.g., `Data@Abun`, `Data@FMSY_M`,
`Data@BMSY_B0`) that `MSEtool`’s new observation model does not yet
populate when converting `data` to `Data`. These MPs fail with an
informative error rather than silently returning an invalid
recommendation; see `?Required` for each MP’s data requirements.

## Installation

You can install the released version of DLMtool from
[CRAN](https://CRAN.R-project.org) with:

``` r

install.packages("DLMtool")
```

And the development version from [GitHub](https://github.com/) with:

``` r

# install.packages("pak")
pak::pak("Blue-Matter/DLMtool")
```

## Documentation

- **[openMSE.com](https://openMSE.com)**: general information about the
  openMSE framework
- **[docs.openMSE.com](https://docs.openMSE.com)**: technical manual
  with worked examples covering operating model construction,
  simulation, and MSE analysis
- **[dlmtool.openmse.com](https://dlmtool.openmse.com)**: full function
  reference for `DLMtool`

The current version of the DLMtool package is available for download from [CRAN](https://CRAN.R-project.org/package=DLMtool).

## DLMtool 6.0.7
- patch to fix issues with NEWS.md

## DLMtool 6.0.6
- patch to fix typos in help documentation 

## DLMtool 6.0.5

### Minor Changes
- fixed minor bug in plotting MP output when NAs in the TAC

## DLMtool 6.0.4

### Minor Changes
- re-wrote LBSPR in TMB for faster run time

## DLMtool 6.0.3

### Fixes
- Fix `LBSPR` when calendar years are provided in `Data@Year`
- Fix indexing error for `CV_Ind` in `Iratio`

## DLMtool 6.0.2

### Fixes
- Fixed issue with `LtargetE` MP where it was incorrectly averaging across simulations (thanks to [Ernesto Carrella](https://github.com/DLMtool/DLMtool/pull/334) for spotting this)


## DLMtool 6.0.1 

### Fixes
- `LBSPR` MP updated to handle missing CAL data
- effort recommendation in `LBSPR` is now recursive

## DLMtool 6.0.0
V6.0.0 is a major update to the `DLMtool` package. It is not backwards compatible with previous versions of `DLMtool` or `MSEtool`.

### Major Changes
- The code in the `DLMtool` package is now limited to the collection of the data-limited management procedures. 
- All operating model simulation and projection functions have now been moved to the new version of `MSEtool` (v3+). 
- `MSEtool` v3+ is a dependency for `DLMtool` v6+, and all operating model simulation and projection functions are available after installing and loading `DLMtool`.

### Fixes
- fix to plus-group calculations


## DLMtool 5.4.5

### New Additions
- time-varying discard rate can now be added with `cpars$DR_y` - matrix nsim rows and nyears+proyears columns

### Fixes
- fix issue with total removals calculation when MPs change discard ratio
- fix issue with discard rate (DR) in cpars. 

## DLMtool 5.4.4

### New Additions
- Management procedures can now update the discard rate (`Rec@DR`)
- Catchability parameter (q) can now be passed in with cpars (`OM@cpars$qs`). Doesn't optimize for depletion and updates `OM@D`.
- Units for the additional indices (`Data@AddInd`) can now be specified using `Data@AddIunits` (numeric vector length n.ind 1=biomass (default) 0=numbers).
- Additional indices can now use total, spawning, or vulnerable biomass using `Data@AddIndType` (numeric vector length n.ind 1=total stock (default), 2=spawning stock, 3=vulnerable stock).

### Fixes
- fix issue where `Misc$Removals` wasn't being returned in parallel mode.
- fix issue with `XL2OM` for latest version of R (behavior of `base::data.matrix` changed)
- minor fixes for R V4.0
- fix to calculation of retained and total catch - thanks to K. Sys for picking this up.

## DLMtool 5.4.3 

### Minor changes
- Added spatial sampling for some data. Set the fraction of sampling within each area 
as a named list in `OM@cpars$control$Sample_Area`; e.g., `OM@cpars$control$Sample_Area$Catch`
The following names are accepted:
   - `Catch` (includes average catch);
   - `BInd` total biomass index
   - `SBInd` spawning biomass index
   - `VInd` vulnerable biomass index
   - `RecInd` recruitment index
   - `CAA` - catch-at-age
   - `CAL` - catch-at-length (also applies to mean length, length-at-first capture, etc)
   Each must be an array with dimensions `c(nsim, nyears+proyears, nareas)`.

### Fixes
- fix bug when optimizing for vulnerable depletion in parallel mode
- fix issue where latest version of `DT` package broke `PMObj` and `PMLimit` tables
- fix catch bias for projections when conditioning on real data
- fix retention-at-age when retention-at-length passed in `OM@cpars`
- fix bug in `LBSPR_MLL` MP 
- correction for auto-correlation in index when real data is used to condition model.


## DLMtool 5.4.2 

### Minor changes
- `validcpars` now returns a HTML data table with information on parameters that can be passed in `OM@cpars`
- add new slots to Data object: `Data@VInd` and `Data@SpInd` for relative vulnerable and spawning abundance respectively. Also add CV slots for each. Note that these use the same observation error and betas as `Data@Ind` (total abundance) and all built-in MPs use `Data@Ind`. 
- `Sub` function now subsets Data in MSE object by MP.
- `Converge` now returns a summary table of convergence diagnostics (thanks to Sarah Valencia)
- add total removals (catch plus discards) to `MSE@Misc$Removals`
- units of `Data@AddInd` can now be specified with `cpars$AddIUnits`: numeric vector of length `n.ind` with 1 specifying biomass (default) and 0 abundance by numbers.
- moved all non-essential packages to `Suggests`
- removed deprecated function `ForceCor`, use `LH2OM` instead

### Fixes
- fix bug where CAL_bins wasn't calculated when only CAL_mids was provided in Data
- fix issue when all values for maturity-at-age (provided in cpars; `cpars$Mat_age`) are greater than 0.5. Assume A50 is 1 in this case.
- fix issue in parallel mode when cpars only is `cpars$Data`
- fix issue in SubOM when OM is empty
- correction for auto-correlated variability in recruitment per http://dx.doi.org/10.1139/cjfas-2016-0167
- fix warning message when creating PMLimit and PMobject tables
- fix error passing `CAL_bins` or `binWidth` in cpars 

## DLMtool 5.4.1

### Minor changes
- minor changes to comply with new R standard (matrices are now class matrix and class array)

### Fixes 
- fix issue with calculating F in the bio-economic model
- fix index issue in `Data@AddInd`


## DLMtool 5.4.0

### Minor changes 
- The `Data` object has been updated, main new features are the addition of an Effort slot
(`Data@Effort` and `Data@CV_Effort`) and all CV by year for all time-series information.
- the `Data@RInd` slot has been removed and replaced with `Data@AddInd`
- Additional information on the Data object can be found [here](https://dlmtool.github.io/DLMtool/Data/Data.html).

### Fixes
- fix bug where TAE implementation error was affecting TAC controls (thanks to Robyn Forrest and Sean Anderson for finding this)
- fix bug in `Cplot` (thanks Sarah Valencia for picking this up)
- fix bug with `runMSE(Hist=TRUE)` where under some conditions the `Hist` object could not be stitched back together. 
- add informative error message when MPs are dropped because they crash

### New Additions
- Added average annual variability in effort (`AAVE`) performance objective method
- Added MP type as column in `PMObj` function
- Add a constant current catch MP - `CurC`
- new `Dom` function (and removed old `DOM` function)
- add option to include a plus-group (e.g., OMs from `SS2OM`). To use a plus-group, use `OM@cpars$plusgroup = 1`


## DLMtool 5.3.1 
 
### Minor changes 
- add option to specify width of the CAL bins using `OM@cpars$binWidth`
- change MGT calculation from Z to M
- add option to hide printed results in `TradePlot`

### Fixes
- fix indexing issue for recruitment deviations
- fix issue with `cpars$mov` when nareas>2
- fix issue with running MSE in parallel when some MPs fail


## DLMtool 5.3 

### New Features
- The `runMSE` function is now more robust. MPs that fail (i.e. crash R) are now skipped without stopping the entire MSE. A warning message alerts users which MPs have been dropped from the analysis. 
- `runMSE(Hist=TRUE)` returns a new S4 object of class 'Hist'. This change means that information from historical simulations is now accessed using `@` instead of `$`. For example: 
       `Hist <- runMSE(Hist=TRUE)` 
       `TS <- Hist@TSdata # time-series data`
       `Data <- Hist@Data # Data object from end of historical period `
- `runMSE(Hist=TRUE)` now works with parallel processing
- The [cheat sheets](https://dlmtool.github.io/DLMtool/cheat_sheets/CheatSheets.html) have been updated. They can be accessed from within the R console using `cheatsheets`
- It is now possible to specify time-varying movement between areas using `OM@cpars$mov`.
- `Uses` function has been added to return MPs that use a particular data slot. For example: `Uses('AvC`)
- Depletion for the initial year of the simulations can now be specified using `OM@cpars$initD`.
- Real indices of abundance can be added to the Data object and used to condition OM. 
- The calculations for unfished and MSY reference points have been standardized and are now fully described in the [userguide](https://dlmtool.github.io/DLMtool/userguide/assumptions-of-dlmtool.html#calculating-reference-points.html)
- New functions `PMLimit` and `PMObj` have been added to generate interacive HTML tables showing the performance of MPs (using objects of class `PM`)
- An argument `Labels` has been added to the `TradePlot` function and related functions (`Tplot` etc). This allows users to replace the default MP name with something more user-friendly. For example: `TradePlot(MSE, Labels=list(AvC="Average Catch"))`. An argument `cols` has also been added so users have full control on the colors of the points and labels. The MP labels can be removed completely by setting the `lab.size` argument to `NULL`

 
### Major changes 
- The slots for specifying gradients in life-history parameters (e.g `Stock@Mgrad`, `Stock@Linfgrad`) 
have been removed. Time-varying parameters should now be specified with `OM@cpars`.
- Biological reference points (SSB0, BMSY, FMSY, etc) are now calculated using a running average of the life-history 
and selectivity parameters over a period equal to the age of maturity for each simulation. See the [userguide](https://dlmtool.github.io/DLMtool/userguide/assumptions-of-dlmtool.html#calculating-reference-points.html) for more information. 
- The `AnnualMSY` argument is now deprecated. MSY reference points are now always calculated in every time-step.
- The `runMSErobust` function has been now removed from package (it was broken in the previous version). 

### Fixes
- fix issue with importing `Data` objects with larger number of length bins
- fix issue where length-at-age was negative with high t0
- allow custom area size for nareas > 2 in cpars
- fix issue with `curE75` which was ratcheting down effort 
- fix issue with effort calculation when both effort control and TAC are implemented
- fix random seed in `Turing` function
- speed up plots in `Turing` function
- speed up plots in `summary(Data)`
- fix bug in CAL_nsamp and CAL_ESS when importing Obs object from CSV
- fix typo in documentation for Itarget MPs


## DLMtool 5.2.3

### New features
- A two-page cheat-sheet has been developed for main DLMtool functions. Access the 
online version with `cheatsheets()`
- New function to provide bootstrapped samples of von Bertalanffy growth parameters directly to cpars (`Growth2OM`)
- New function to estimate length-weight parameters from data (`LW2OM`). 

### Minor changes
- update `plotMPA` to include relative size of areas

### Fixes
- export built in MPs from MSEtool package to parallel cluster
- fix issue with CAA at very low stocks sizes
- fix issue with MSY calculations with Ricker SRR

## DLMtool 5.2.2

### Fixes
- fix issue with hyperstability/depletion for future projections
- `MSE@OM` has been updated to only include historical conditions.
- Fix issue with `Converge` in 5.2.1
- improvement to `XL2Data` to read files from other than working directory
- more flexibility to `summary(Data)` 

## DLMtool 5.2.1

### Minor fixes
- Fix issues with `PM` functions when `MSE@nMPs == 1`
- Fix minor issue with cpp code to pass CRAN checks

## DLMtool 5.2

### New Features
- option for variable management interval by MP in `runMSE`. `OM@interval` can now be a vector of length `nMPs`, to specify different
management intervals for different MPs. For example, with `OM@interval=c(1,5)` and `runMSE(OM, MPs=c('AvC', 'BK')), `AvC` is applied every
year and `BK` is applied every 5 years. `OM@interval` is recycled if not the same length as number of MPs. 

### New Functions
- `makeMeanMP` has been added to generate a MP that averages output from a list of other MPs.
- `Turing` has been added to compare simulated data from an OM to the real data in the fishery Data object.
- `LH2OM` and  `predictLH` have been added to predict correlated life-history parameters from FishBase using FishLife model.


### Updated Functions
- improved convergence diagnostic with updated `Converge` function
- `Replace` function has been updated to replace directly from individual Stock, Fleet, Obs, and Imp objects instead of from only OM objects
- The plots produced by `summary(Data)` function have been improved 
- `makePerf` has been replaced with `tinyErr` function with options to remove process error, observation error, and gradients
- additional MPs have been added: effort-based LBSPR and variants of existing MPAs
- `PM` (Performance Metric) methods have been updated and described in the user guide 
- MSE trade-off functions have been updated: `Trade_Plot`, `Tplot`, `Tplot2`, and `Tplot3`
- `Fease` has been simplified and updated. Fease object has now been removed


### Improved Documentation 
- similar functions and MPs have been combined into single help files
- all MPs now have an argument `plot` and examples in the online documentation
- documentation for MPs has been improved, including equations for calculations of TAC, TAE and size-limits
- custom parameters (`OM@cpars`) have been updated and now have better documentation 
- the user guide `userguide()` has been updated and additional chapters added on new features

### Minor Fixes and Edits
- modified catch-at-length generation code to deal with dome-shaped selectivity better
- fixed issue where OMs were not reproducible if some slots had no variability
- new slots have been added to the `Data` object: `Common_Name`, `Species`, `Region`, and for data-rich MPs in MSEtool: `sigmaR` (recruitment error)
- iSCAM and SS2DLM functions have been moved from DLMtool to MSEtool
- added LHdatabase from FishLife and functions to predict life-history parameters 


## DLMtool 5.1.3 
- fix Replace function for new OM slots
- fix indexing issue for size comps when there are only two size classes 
- fix indexing issue for spawning biomass & MSY calcs for Ricker SRR in V5.1
- automatically call `setup()` if `runsMSE(parallel=TRUE)` and cluster hasn't been initialized
- automatically export custom MPs to cluster if `runsMSE(parallel=TRUE)` 
- fix index issue in `SPmod`

## DLMtool 5.1.2
- Add contributors and more examples

## DLMtool 5.1.1
- Patch for indexing error in first projection year population dynamics. 


## DLMtool 5.1
### Operating Model

- Mixed MPs: it is now possible to design MPs that combine Output and Input controls. Previously, MPs in DLMtool where either class 'Input' or class 'Output'. This has changed, and all MPs are now class 'MP' and return a standard recommendation object ('Rec') that allows specification of any combination of catch limit, effort limit, spatial closure, and size-at-selection and/or size-at-retention regulations. 

- MP types: For convenience, MPs can be categorised into 4 types: 'Output' (only catch limits), 'Input' (only spatial, effort, and/or size regulations), 'Mixed' (some combination of Output and Input regulations), and 'Reference' (MPs such as FMSYref or NFref which are designed to be used a references and not for actual applications). The function `MPtype` can be used to determine an MP's type, e.g `MPtype('AvC')`. 

- Increased flexibility of selectivity, retention, and discard mortality controls: MPs can now modify both selectivity and retention curves, and also modify the level of discard mortality.

- Historical MPAs: A new slot `MPA` has been added to the `Fleet` object. This allows users to specify the historical year and the fraction of an area that was closed. See `?plotMPA` for an example. 

- Improvements to MSY reference point calculations: MSY reference points are now calculate for every year. This accounts for changes in productivity (e.g., increases in growth) that affect reference points such as BMSY and FMSY.

- Increased number of areas: By default DLMtool is a 2-area model. The code has now been updated to include more areas if required.

- Movement by age: It is now possible to specify movement by age, such as ontogenetic migration offshore 

- Parallel processing: `runMSE` has been optimized for parallel processing. By default, parallel processing is not used if `nsim`<=48. We suggest testing your OM with a low number of simulations (e.g `nsim`=48) and then increasing the number of simulations and using parallel processing: `runMSE(OM, MPs, parallel=TRUE)`. Update messages are not displayed in parallel mode. 

- Taxonomic information: New slots have been added to the `Stock` object to record common name and taxonomic details.  

### MP Performance

- The `Converge` function has been updated with a improved of convergence diagnostics.  

- A new performance metric (`PM`) class has been added. This allows users to develop a custom set of performance metrics for their management system. A series of example `PM` objects have been created (see `avail('PM')`). Over time the summary and plotting functions will be updated to take a set of `PM` objects. See `Tplot3` for an example.

### Robustness and Testing

- Many improvements to functions (e.g MPs) to improve robustness and avoid model crashes due to stochastic sampling of parameters.

- All code in DLMtool is now tested using the `testthat` package to ensure that the functions work as expected. Please continue to file bug reports at: https://github.com/DLMtool/DLMtool/issues


### Documentation 

- The User Manual has been completely revised and updated. Use `userguide()` to access. Please submit any typo corrections or suggestions for improvement at https://github.com/DLMtool/DLMtool_UserGuide/issues. Pull requests are welcome. 

- We are developing an online library of DLMtool OMs (http://www.datalimitedtoolkit.org/fishery_library) which has the OM Report, OM Excel file, and OM R data object for each DLMtool OM. A standardized MSE report is in development. The OM library will be expanded as new OMs are developed. Please contact us if you have developed OMs and are able to make them publicly available.

- A DLMtool user forum is in development and will be launched soon. The idea of the forum is to provide a platform for DLMtool users to ask questions and share experience with each other and the DLMtool team. 


## DLMtool 5.0
The following slots have been added to the OM object:

- `OM@interval`
- `OM@pstar`
- `OM@maxF`
- `OM@reps`

This was done so that an OM object is completely self-contained and includes all information used in the MSE. 

### Minor Changes 

- BMSY/B0 now calculated from B0 assuming current conditions, i.e what would B0 be with today's productivity

## DLMtool v4.4.1

### Minor Changes 

- fixed a typo in V4.4 that affected effort controls
- removed redundant code to speed up sampling of fleet parameters


## DLMtool v4.4   

### Changes 

- can now specify different retention and vulnerability at size curves to evaluate impact of discarding for sub-legal fish
- can now include general discarding across all size/age classes
- The structure of Input control MPs has been simplified. See the userguide for more details.
- The userguide can now be directly accessed from the console with: userguide()
- Additional operating models and other objects can be loaded from the DLMdata package, use: GetMoreData()
- Age or size-specific M has been updated (was in previous version) with plotting functions to visualize M-at-age
- All MPs have been thoroughly tested and modified to improve robustness and avoid crashing the model
- plotting functions have been improved 
- SRA has been converted to RCpp for significant speed gain 

## DLMtool v4.1

### Major Changes

- Objects names have been shortened and modified for consistency: 
  - Observation has been renamed to Obs 
  - DLM_fease has been renamed to Fease 
  - DLM_output has been renamed Output
  - DLM_input has been renamed Input 
  - DLM_data has been renamed Data 

- Implementation error and a dedicated implementation error object called 'Imp', (like Stock, Fleet and Obs)
   that can account for variability and overages/underages in both effort, catch and size limit advice (discarding
   rate and post release mortality rate are coming soon)

- At least 10 new example operating models from real DLMtool applications in the US and Canada

- Stochastic SRA operating model functions (i.e. build a full operating model accounting for correlations in
   parameters using historical catch trends and some composition data)

- Full plots of operating model conditions

- Stock-synthesis assessment to DLM function for specifying operating models (currently MLE only but adding
   MCMC and hessian options)

- iSCAM assessment to DLM support for specifying operating models (MPD only but adding MCMC and hessian options soon)

- Tracking of historical versus current simulated age composition in catches and population over simulations

- New function 'Replace' for copying parts of an operating model to another operating model (e.g. Robin Hood
  approach,where you may want to borrow say, the fleet characteristics from another operating model)

- Estimation of a new reference point 'Blow' for calculation of conservation-related performance metrics
   (Blow is the spawning biomass where it takes HZN number of mean generation times to reach Bfrac 
   fraction of SSBMSY given zero catches, where the user can specify HZN and Bfrac). 

- Canadian DFO performance plots (DFO_hist, DFO_proj, DFO_plot2)

- Biomass recovery relative to Blow plots (COSEWIC_plot)

- A dedicated custom parameters slot in the operating model object. This is a list where the user can place custom 
   parameters samples (from any distribution / correlation structure you wish) that are named as they appear in 
   the operating model. 

### Minor Changes 

- Fsd slot in Fleet object has been re-named Esd 

## DLMtool V3.2.3

### Major Changes
- all objects previously in `DLMdat` have now been added as separate data objects. This means that it is no longer necessary to unpack data objects at the beginning of an R session.
- parallel processing can be initialized with a new function `setup()`
- `runMSE` and `runMSErobust` functions have a new logical argument `Hist`. When `Hist=TRUE` the model returns the historical simulations only. 
- `CheckConverg` has been deprecated - use `Converge` now to check MSE for convergence
- several optimization functions in the historical simulations have been re-coded in C++ using the Rcpp package (about 10x faster)

### Minor Changes
- package now uses Roxygen2 for all documentation. 
- exported several previously internal functions that make it easier for users to examine code
- removed LBSPR functions and replaced with dependency on LBSPR package 
- moved `custompars` section in `runMSE.r` and renamed parameters to match OM object
- modified MSE code so that `R0` can be a vector `nsim` long
- `custompars` has been moved in the MSE code so that more parameters can be passed in to the MSE. A message alerts users which valid parameters have been found in `custompars` and any invalid parameters are displayed in a warning message 
- changed variable name `BMSY_B0` to `SSBMSY_SSB0` to avoid confusion
- added projected spawning stock biomass `SSB` and vulnerable biomass `VB` to MSE object
- added `SpAbun` slot to data object for abundance of spawning stock. The `Abun` slot relates to vulnerable biomass
- added `ntrials` and `fracD` control arguments to `runMSE`. Allows user to modify the maximum number of re-samples in the optimization to achieve the sampled depletion. The model will stop if a proportion greater than `fracD` of the simulated depletion values are not the same as the sampled values after more than `ntrials` re-samples


### Bug Fixes 
- fixed typo in `getr` function  
- fixed indexing error in Ricker SRR fixed
- fixed bug in catch-at-length and catch-at-age generation code where years were being indexed incorrectly
- fixed bug in `ChooseEffort` function where nyears was being set to 0 in some cases 
- fixed bug in calculation of Lbar
- fixed colors in `Pplot2` for F/FMSY
- fixed calculation of bias in steepness when `hcv` is 0 in the runMSE code
- LFC and LFS in future projections weren't being updated correctly
- fixed F calculations at end of MSE so that `FMSYref` results in exactly F/FSMY = 1 
- `maxF` now also applies to the catch that is taken from the population

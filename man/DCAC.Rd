% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs_Output.R
\name{DCACs}
\alias{DCACs}
\alias{DCAC}
\alias{DCAC_40}
\alias{DCAC4010}
\alias{DCAC_ML}
\alias{DAAC}
\alias{HDAAC}
\title{Depletion Corrected Average Catch}
\usage{
DCACs(x, Data, reps = 100, plot = FALSE)

DCAC(x, Data, reps = 100, plot = FALSE)

DCAC_40(x, Data, reps = 100, plot = FALSE)

DCAC4010(x, Data, reps = 100, plot = FALSE)

DCAC_ML(x, Data, reps = 100, plot = FALSE)

DAAC(x, Data, reps = 100, plot = FALSE)

HDAAC(x, Data, reps = 100, plot = FALSE)
}
\arguments{
\item{x}{A position in the data object}

\item{Data}{A data object}

\item{reps}{The number of stochastic samples of the MP recommendation(s)}

\item{plot}{Logical. Show the plot?}
}
\value{
An object of class \code{\link[MSEtool]{Rec-class}} with the \code{TAC} slot populated with a numeric vector of length \code{reps}
}
\description{
This group of MPs calculates a catch limit (\emph{dcac}; intended as an MSY proxy) based on
average historical catch while accounting for the windfall catch that got the stock down to
its current depletion level (\emph{D}).
}
\details{
The method calculates the depletion-corrected average catch (\emph{dcac}) as:

\deqn{\textrm{dcac} = \frac{\sum_{y=1}^{n}{C_y}}{n+(1-D)/Y_{\textrm{pot}}}}

where
\deqn{Y_{\textrm{pot}} = \frac{B_{\textrm{MSY}}}{B_0}\frac{F_{\textrm{MSY}}}{M}M}
and \eqn{C} is the historical catches; i.e \eqn{C} does not change in the future projections in the MSE

The methods differ in the assumptions of current depletion (\emph{D}). See the \strong{Functions} section below for details.
}
\section{Functions}{
\itemize{
\item \code{DCACs}: Depletion is not updated in the future projections.
The TAC is static and not updated in the future years. This represents
an application of the DCAC method where a catch limit is calculated based on
current estimate of depletion and time-series of catch from the beginning
of the fishery, and the TAC is fixed at this level for all future projections.

\item \code{DCAC}: Depletion is estimated each management interval and used to
update the catch limit recommendation based on the historical catch (which is
not updated in the future projections).

\item \code{DCAC_40}: Current stock biomass is assumed to be exactly at 40 per cent
of unfished levels. The 40 percent depletion assumption may not
really affect DCAC that much as it already makes TAC recommendations that are
quite MSY-like.

\item \code{DCAC4010}: The dynamic DCAC (depletion is updated) is paired with the 40-10 rule that throttles
back the OFL to zero at 10 percent of unfished stock size (the OFL is not subject to downward
adjustment above 40 percent unfished). DCAC can overfish below BMSY levels. The 40-10
harvest control rule largely resolves this problem providing an MP with surprisingly good
performance even at low stock levels.

\item \code{DCAC_ML}: This variant uses the mean length estimator to calculate current stock
depletion. The mean length extension was programmed by Gary Nelson as part of his
excellent R package 'fishmethods'.

\item \code{DAAC}: Depletion Adjusted Average Catch: essentially DCAC (with updated Depletion)
divided by BMSY/B0 (Bpeak) (Harford and Carruthers, 2017).

\item \code{HDAAC}: Hybrid Depletion Adjusted Average Catch: essentially DCAC  (with updated Depletion)
divided by BMSY/B0 (Bpeak) when below BMSY,
and DCAC above BMSY (Harford and Carruthers 2017).
}}

\note{
It's probably worth noting that DCAC TAC recommendations do not tend
to zero as depletion tends to zero. It adjusts for depletion only in
calculating historical average catch. It follows that at stock levels much
below BMSY, DCAC tends to chronically overfish.
}
\section{Required Data}{

See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr


\code{DCACs}: AvC, BMSY_B0, Dt, FMSY_M, LHYear, Mort, Year, t


\code{DCAC}: AvC, BMSY_B0, Dt, FMSY_M, LHYear, Mort, Year, t


\code{DCAC_40}: AvC, BMSY_B0, FMSY_M, LHYear, Mort, Year, t


\code{DCAC4010}: AvC, BMSY_B0, Dt, FMSY_M, LHYear, Mort, Year, t


\code{DCAC_ML}: AvC, CAL, Cat, LHYear, Lbar, Lc, Mort, Year, t, vbK, vbLinf


\code{DAAC}: AvC, BMSY_B0, Dt, FMSY_M, LHYear, Mort, Year, t


\code{HDAAC}: AvC, BMSY_B0, Dt, FMSY_M, LHYear, Mort, Year, t
}

\section{Rendered Equations}{



See \href{https://dlmtool.openmse.com/reference/DCAC.html}{Online Documentation} for correctly rendered equations










}

\examples{
DCACs(1, MSEtool::Atlantic_mackerel, plot=TRUE)

DCAC(1, MSEtool::Atlantic_mackerel, plot=TRUE)

DCAC_40(1, MSEtool::Atlantic_mackerel, plot=TRUE)

Data <- MSEtool::Atlantic_mackerel
Data@LHYear <- 2005
DCAC4010(1, Data, plot=TRUE)

DCAC_ML(1, MSEtool::SimulatedData, plot=TRUE)

Data <- MSEtool::Atlantic_mackerel
Data@LHYear <- 2005
DAAC(1, Data, plot=TRUE)

Data <- MSEtool::Atlantic_mackerel
Data@LHYear <- 2005
HDAAC(1, Data, plot=TRUE)

}
\references{
MacCall, A.D., 2009. Depletion-corrected average catch: a simple
formula for estimating sustainable yields in data-poor situations. ICES J.
Mar. Sci. 66, 2267-2271.

Harford W. and Carruthers, T. 2017. Interim and long-term performance of
static and adaptive management procedures. Fish. Res. 190, 84-94.
}
\seealso{
Other Average Catch MPs: 
\code{\link{AvC_MLL}()},
\code{\link{AvC}()}
}
\author{
T. Carruthers
}
\concept{Average Catch MPs}

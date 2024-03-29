% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs_Output.R
\name{DD}
\alias{DD}
\alias{DD4010}
\title{Delay - Difference Stock Assessment}
\usage{
DD(x, Data, reps = 100, plot = FALSE)

DD4010(x, Data, reps = 100, plot = FALSE)
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
A simple delay-difference assessment with UMSY and MSY as leading parameters
that estimates the TAC using a time-series of catches and a relative
}
\details{
This DD model is observation error only and has does not estimate
process error (recruitment deviations). Assumption is that knife-edge
selectivity occurs at the age of 50\% maturity. Similar to many other assessment
models it depends on a whole host of dubious assumptions such as temporally
stationary productivity and proportionality between the abundance index and
real abundance. Unsurprisingly the extent to which these assumptions are
violated tends to be the biggest driver of performance for this method.

The method is conditioned on effort and estimates catch. The effort is calculated
as the ratio of catch and index. Thus, to get a complete effort time series, a full
time series of catch and index is also needed. Missing values are linearly interpolated.

A detailed description of the delay-difference model can be found in Chapter 9 of Hilborn
and Walters (1992).
}
\section{Functions}{
\itemize{
\item \code{DD}: Base version where the TAC = UMSY * Current Biomass.

\item \code{DD4010}: A 40-10 rule is imposed over the TAC recommendation.
}}

\section{Required Data}{

See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr


\code{DD}: Cat, Ind, L50, MaxAge, Mort, vbK, vbLinf, vbt0, wla, wlb


\code{DD4010}: Cat, Ind, L50, MaxAge, Mort, vbK, vbLinf, vbt0, wla, wlb
}

\section{Rendered Equations}{

See \href{https://dlmtool.openmse.com/reference/DD.html}{Online Documentation} for correctly rendered equations


}

\examples{
DD(1, Data=MSEtool::Atlantic_mackerel, plot=TRUE)
DD4010(1, Data=MSEtool::Atlantic_mackerel, plot=TRUE)
}
\references{
Carruthers, T, Walters, C.J,, and McAllister, M.K. 2012. Evaluating methods that classify
fisheries stock status using only fisheries catch data. Fisheries Research 119-120:66-79.

Hilborn, R., and Walters, C. 1992. Quantitative Fisheries Stock Assessment: Choice,
Dynamics and Uncertainty. Chapman and Hall, New York.
}
\seealso{
Other Delay-Difference MPs: 
\code{\link{DDe}()}
}
\author{
T. Carruthers
}
\concept{Delay-Difference MPs}

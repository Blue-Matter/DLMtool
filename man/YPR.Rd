% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs_Output.R
\name{YPR}
\alias{YPR}
\alias{YPR_CC}
\alias{YPR_ML}
\title{Yield Per Recruit analysis to get FMSY proxy F01}
\usage{
YPR(x, Data, reps = 100, plot = FALSE)

YPR_CC(x, Data, reps = 100, plot = FALSE, Fmin = 0.005)

YPR_ML(x, Data, reps = 100, plot = FALSE)
}
\arguments{
\item{x}{A position in the data object}

\item{Data}{A data object}

\item{reps}{The number of stochastic samples of the MP recommendation(s)}

\item{plot}{Logical. Show the plot?}

\item{Fmin}{The minimum fishing mortality rate inferred from the catch-curve
analysis}
}
\value{
An object of class \code{\link[MSEtool]{Rec-class}} with the \code{TAC} slot populated with a numeric vector of length \code{reps}
}
\description{
A simple yield per recruit approximation to FMSY (F01) which is the position
of the ascending YPR curve for which dYPR/dF = 0.1(dYPR/d0)
}
\details{
The TAC is calculated as:
\deqn{\textrm{TAC} = F_{0.1} A}
where \eqn{F_{0.1}} is the fishing mortality (\emph{F}) where the slope of the yield-per-recruit
(YPR) curve is 10\\% of the slope at the origin, and \emph{A} is an estimate of current abundance.

The YPR curve is calculated using an equilibrium age-structured model with life-history and
selectivity parameters sampled from the \code{Data} object.

The variants of the YPR MP differ in the method to estimate current abundance (see Functions section below). #'
}
\section{Functions}{
\itemize{
\item \code{YPR}: Requires an external estimate of abundance.

\item \code{YPR_CC}: A catch-curve analysis is used to determine recent Z which given M (Mort)
gives F and thus abundance = Ct/(1-exp(-F))

\item \code{YPR_ML}: A mean-length estimate of recent Z is used to infer current
abundance.
}}

\note{
Based on the code of Meaghan Bryan
}
\section{Required Data}{

See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr


\code{YPR}: Abun, LFS, MaxAge, vbK, vbLinf, vbt0


\code{YPR_CC}: CAA, Cat, LFS, MaxAge, vbK, vbLinf, vbt0


\code{YPR_ML}: CAL, Cat, LFS, Lbar, Lc, MaxAge, Mort, vbK, vbLinf, vbt0
}

\section{Rendered Equations}{

See \href{https://dlmtool.openmse.com/reference/YPR.html}{Online Documentation} for correctly rendered equations




}

\examples{
YPR(1, MSEtool::SimulatedData, plot=TRUE)
YPR_CC(1, MSEtool::SimulatedData, plot=TRUE)
YPR_ML(1, MSEtool::SimulatedData, plot=TRUE)
}
\references{
Beverton and Holt. 1954.
}
\author{
Meaghan Bryan and Tom Carruthers
}

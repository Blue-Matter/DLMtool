% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs_Output.R
\name{CompSRA}
\alias{CompSRA}
\alias{CompSRA4010}
\title{Age-Composition Stock-Reduction Analysis}
\usage{
CompSRA(x, Data, reps = 100, plot = FALSE)

CompSRA4010(x, Data, reps = 100, plot = FALSE)
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
A stock reduction analysis (SRA) model is fitted to the age-composition
from the last 3 years (or less if fewer data are available)
}
\details{
A stock reduction analysis (SRA) model is fitted to the age-composition
from the last 3 years (or less if fewer data are available) assuming a constant
total mortality rate (\emph{Z}) and used to estimate current stock depletion (\emph{D}),
\eqn{F_\textrm{MSY}}, and stock abundance (\emph{A}).

Abundance is estimated in the SRA. \eqn{F_{\textrm{MSY}}} is calculated assuming
knife-edge vulnerability at the age of full selection.

The TAC is calculated as \eqn{F_\textrm{MSY} A}. \code{CompSRA4010} uses a 40-10
harvest control rule to reduce TAC at low biomass.
}
\section{Functions}{
\itemize{
\item \code{CompSRA}: TAC is FMSY x Abundance

\item \code{CompSRA4010}: With a 40-10 control rule based on estimated depletion
}}

\section{Required Data}{

See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr


\code{CompSRA}: CAA, Cat, L50, LFC, LFS, MaxAge, Mort, steep, vbK, vbLinf, vbt0, wla, wlb


\code{CompSRA4010}: CAA, Cat, L50, LFC, LFS, MaxAge, Mort, steep, vbK, vbLinf, vbt0, wla, wlb
}

\section{Rendered Equations}{

See \href{https://dlmtool.openmse.com/reference/CompSRA.html}{Online Documentation} for correctly rendered equations


}

\examples{
\dontrun{
CompSRA(1, MSEtool::SimulatedData, plot=TRUE)
}

CompSRA4010(1, MSEtool::SimulatedData, plot=TRUE)

}
\author{
T. Carruthers
}

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs_Output.R
\name{AvC}
\alias{AvC}
\title{Average Catch}
\usage{
AvC(x, Data, reps = 100, plot = FALSE)
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
A simple average catch MP that is included to demonstrate a 'status quo' management option
}
\details{
The average catch method is very simple. The mean historical catch is calculated and used to set
a constant catch limit (TAC). If \code{reps} > 1 then the \code{reps} samples are drawn from a log-normal
distribution with mean \code{TAC} and standard deviation (in log-space) of 0.2.

For completeness, the TAC is calculated by:

\deqn{\textrm{TAC} =\frac{\sum_{y=1}^{\textrm{n}}{C_y}}{\textrm{n}}}

where \eqn{\textrm{TAC}} is the the mean catch recommendation, \eqn{n} is the number of historical years, and
\eqn{C_y}  is the catch in historical year \eqn{y}
}
\section{Required Data}{

See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr


\code{AvC}: Cat, LHYear, Year
}

\section{Rendered Equations}{

See \href{https://dlmtool.openmse.com/reference/AvC.html}{Online Documentation} for correctly rendered equations
}

\examples{
Rec <- AvC(1, MSEtool::Cobia, reps=1000, plot=TRUE) # 1,000 log-normal samples with CV = 0.2

}
\seealso{
Other Average Catch MPs: 
\code{\link{AvC_MLL}()},
\code{\link{DCACs}()}
}
\author{
T. Carruthers
}
\concept{Average Catch MPs}

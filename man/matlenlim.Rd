% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MPs_Input.R
\name{matlenlim}
\alias{matlenlim}
\alias{matlenlim2}
\alias{minlenLopt1}
\alias{slotlim}
\title{Size limit management procedures}
\usage{
matlenlim(x, Data, reps, plot = FALSE)

matlenlim2(x, Data, reps, plot = FALSE)

minlenLopt1(x, Data, reps, plot = FALSE, buffer = 0.1)

slotlim(x, Data, reps, plot = FALSE)
}
\arguments{
\item{x}{A position in the data object}

\item{Data}{A data object}

\item{reps}{The number of stochastic samples of the MP recommendation(s)}

\item{plot}{Logical. Show the plot?}

\item{buffer}{Parameter controlling the fraction of Lopt to set the minimum
length of fish caught: minlen=Lopt*(0.7+buffer).}
}
\value{
An object of class \code{\link[MSEtool]{Rec-class}} with the Retention slot(s) populated
}
\description{
A set of size-selectivity MPs that adjust the retention curve of the fishery.
}
\details{
The the \code{LF5} and \code{LFR} slots in the \code{Rec} object are modified to change the
retention curve (length at 5 per cent and smallest length at full retention
respectively). A upper harvest slot limit can be set using the \code{Rec@HS} slot.
The underlying selectivity pattern of the fishing gear does
not change, and therefore the performance of these methods depends on the
degree of discard mortality on fish that are selected by the gear but not
retained by the fishery (\code{Stock@Fdisc}).

The level of discard mortality can be  modified using the \code{Rec@Fdisc} slot
which over-rides the discard mortality set in the operating model.

The selectivity pattern can be adjusted by creating MPs that modify the selection
parameters (\code{Rec@L5}, \code{Rec@LFS} and \code{Rec@Vmaxlen}).
}
\section{Functions}{
\itemize{
\item \code{matlenlim}: Fishing retention-at-length is set equivalent to the maturity curve.

\item \code{matlenlim2}: Fishing retention-at-length is set slightly higher (110\\%)
than the length-at-maturity

\item \code{minlenLopt1}: The minimum length of retention is set to a fraction of
the length that maximises the biomass, Lopt. The aim
of this simple MP is restrict the catch of small fish to rebuild
the stock biomass towards the optimal length, Lopt, expressed in terms of
the growth parameters Lopt=b/(M/k+b) (Hordyk et al. 2015)

\item \code{slotlim}: Retention-at-length is set using a upper harvest slot limit;
that is, a minimum and maximum legal length. The maximum limit is set here,
completely arbitrarily, as the 75th percentile between the new minimum legal
length and the estimated asymptotic length Linf. This MP has been included
to demonstrate an upper harvest slot limit.
}}

\section{Required Data}{

See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr


\code{matlenlim}: L50


\code{matlenlim2}: L50


\code{minlenLopt1}: Mort, vbK, vbLinf, wlb


\code{slotlim}: L50, vbLinf
}

\section{Rendered Equations}{

See \href{https://dlmtool.openmse.com/reference/matlenlim.html}{Online Documentation} for correctly rendered equations






}

\examples{
matlenlim(1, MSEtool::Atlantic_mackerel, plot=TRUE)
matlenlim2(1, MSEtool::Atlantic_mackerel, plot=TRUE)
minlenLopt1(1, MSEtool::Atlantic_mackerel, plot=TRUE)
slotlim(1, MSEtool::Atlantic_mackerel, plot=TRUE)
}
\references{
Hordyk, A., Ono, K., Sainsbury, K., Loneragan, N., and J.
Prince. 2015. Some explorations of the life history ratios to describe
length composition, spawning-per-recruit, and the spawning potential ratio
ICES Journal of Marine Science, doi:10.1093/icesjms/fst235.
}
\author{
T. Carruthers & A. Hordyk

HF Geromont
}

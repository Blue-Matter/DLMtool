#' @param x A position in the data object
#' @param Data A data object
#' @param reps The number of stochastic samples of the MP recommendation(s)
#' @param plot Logical. Show the plot?
#'
#' @section Required Data:
#' See \code{\link[MSEtool]{Data-class}} for information on the \code{Data} object \cr
#'
#' @return
#'  <%= if(MSEtool::MPtype(mp)[2] == 'Output') paste0("An object of class \\code{\\link[MSEtool]{Rec-class}} with the \\code{TAC} slot populated with a numeric vector of length \\code{reps}") %>
#'  <%= if(MSEtool::MPtype(mp)[2] == 'Reference') paste0("An object of class \\code{\\link[MSEtool]{Rec-class}} with the \\code{TAC} slot populated with a numeric vector of length \\code{reps}") %>
#'  <%= if(MSEtool::MPtype(mp)[2] == 'Input') paste0("An object of class \\code{\\link[MSEtool]{Rec-class}} with the ", paste(MSEtool::MPtype(mp)[3], collapse=','), " slot(s) populated") %>
#'  <%= if(MSEtool::MPtype(mp)[2] == 'Mixed') paste0("An object of class \\code{\\link[MSEtool]{Rec-class}} with the ", paste(MSEtool::MPtype(mp)[3], collapse=','), " slot(s) populated") %>
#'



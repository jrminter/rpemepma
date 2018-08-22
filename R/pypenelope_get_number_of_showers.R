#' Retrieve the number of showers from a pypenelope simulation
#' 
#' Pypenelope seems to write the nnumber of showers as the first entry in the
#' penepma.log file.
#'
#' @param fi String. The path to the penepma.log file. ex: "./penepma.log"
#'
#' @return the number of "showers" i.e. trajectories computed.  (numeric)
#'
#' @export
#' 
pypenelope_get_number_of_showers <- function(fi){
    line <- readLines(fi)[[1]][1]
    showers <- as.numeric(strsplit(line, " ")[[1]][4])
    return(showers)
}

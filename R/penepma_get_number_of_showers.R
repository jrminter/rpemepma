#' Retrieve the number of showers from a penepma simulation
#'
#' @param fi String. The path to the penepma-res.dat file. ex: "./penepma-res.dat"
#'
#' @return the number of "showers" i.e. trajectories computed.  (numeric)
#'
#' @export
#' 
penepma_get_number_of_showers <- function(fi){
  the_line <- readLines(fi, 10)[10]
  res <- as.numeric(strsplit(the_line, " ")[[1]][9])
  return(res)
}

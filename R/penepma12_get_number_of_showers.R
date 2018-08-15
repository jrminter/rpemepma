#' Retrieve the number of showers from a penepma12 simulation
#' 
#' Penepma12 adds to the penepam.dat file. There is no penepma-res.dat file.
#' like penepma16 produces. This function extracts the latest count of the
#' number of showers.
#'
#' @param fi String. The path to the penepma.dat file. ex: "./penepma.dat"
#'
#' @return the number of "showers" i.e. trajectories computed.  (numeric)
#'
#' @export
#' 
penepma12_get_number_of_showers <- function(fi){
    options(scipen = -6) # force printing in exponential format
    res <- grep("Simulated primary showers", readLines(fi), value = TRUE)
    l   <- length(res)
    ret <- res[l]
    y <- as.numeric(strsplit(ret, " ")[[1]][9])
    options(scipen = 3) # reset to default
    return(y)
  }

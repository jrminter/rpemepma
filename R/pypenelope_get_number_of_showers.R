#' Retrieve the number of showers from a pypenelope simulation
#' 
#' If pypenelope ends on a time or uncertainty measure, the number of
#' trajectories seems to be written in the penepma.log file. If the
#' simulation is time limited, the data must be retrieved from the
#' penepma.dat file.
#'
#' @param dir String. The directory with penepma.log file. ex: "here()"
#'
#' @return the number of "showers" i.e. trajectories computed. (numeric)
#'
#' @export
#' 
pypenelope_get_number_of_showers <- function(dir){
    fi_log <- sprintf("%s/penepma.log", dir)
    if(file.exists(fi_log)){
       line <- readLines(fi_log)[[1]][1]
       showers <- as.numeric(strsplit(line, " ")[[1]][4])
       return(showers)
    } else {
       fi <- sprintf("%s/penepma.dat", dir)
       lines <- readLines(fi)
       l <- length(lines)
       line <- lines[l-9]
       showers <- as.numeric(strsplit(line, " ")[[1]][11])
       return(showers)
   }
}

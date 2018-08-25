#' penepma16_read_map_hdr - read the pe-map-0#-depth.dat file
#' and return a list with Z and the transition
#' 
#' A helper function for processing septh data
#' 
#' @param fi A string. the path to the desired file, ex: './pe-map-01-depth.dat'
#' 
#' @return A list. Element 1 is the Z value and element 2 is the trasnition
#' 
#' @export
#' 
penepma16_read_map_hdr <- function(fi){
    ret <- readLines(fi, 2)[2]
    ret <- strsplit(ret, " ")
    z_str <- ret[[1]][11]
    tr_str <- ret[[1]][12]
    Z <- strsplit(z_str, ",")[[1]][1]
    return(c(Z, tr_str))
}

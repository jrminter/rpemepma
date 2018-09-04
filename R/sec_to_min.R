#' A convenience funtion to convert seconds to minutes
#' 
#' Penepma reports simulation times in seconds. This converts to minutes.
#' 
#' @param sec A number. The number of seconds
#' 
#' @param digits An integer. Default 2. Number of digits of precision. Default: 2.
#' 
#' @return A number. The number of minutes.
#' 
#' @export
#' 
sec_to_min <-function(sec, digits=2){return(round(sec/(60), digits))}

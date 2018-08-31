#' A convenience funtion to convert seconds to hrs
#' 
#' Penepma reports simulation times in seconds. This converts to hrs.
#' 
#' @param sec A number. The number of seconds
#' 
#' @param digits An integer. Default 3. Number of digits of precision. Default: 3.
#' 
#' @return A number. The number of hrs.
#' 
#' @export
#' 
sec_to_hr <-function(sec, digits=3){return(round(sec/(60^2), digits))}

#' Convert nm to cm for processing PENEPMA data
#'
#' @param nm A number. The value to convert.
#'
#' @return cm The result in cm 
#'                   
#' @export
#'
#' @examples
#' library(rpenepma)
#' print(cm_to_nm(2.0e-6))

nm_to_cm <- function(nm){
    cm <- 1.0e-7*nm
    return(cm)
}


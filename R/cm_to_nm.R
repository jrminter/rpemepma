#' Convert cm to nm for processing PENEPMA data
#'
#' @param cm A number. The value to convert.
#'
#' @return nm The result in cm 
#'                   
#' @export
#'
#' @examples
#' library(rpenepma)
#' print(cm_to_nm(20.0))

cm_to_nm <- function(cm){
    nm <- 1.0e7*cm
    return(nm)
}

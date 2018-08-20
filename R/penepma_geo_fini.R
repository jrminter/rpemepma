#' penepma_geo_finish the geo file
#' 
#' A helper script to create .geo files.
#'
#' 
#' @return none. Exports by cat to console or file as set previously
#' 
#' @export
#' 
penepma_geo_fini <- function(){
    penepma_geo_hdr_0()
    cat("END      0000000000000000000000000000000000000000000000000000000\n")
}

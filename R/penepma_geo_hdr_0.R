#' Create a header line of repeated zeros.
#' 
#' A helper function to create .geo files
#' 
#' @return none. Exports by cat to  console or file as set previously
#' 
#' @export
#' 
penepma_geo_hdr_0 <- function(){
    str_0 <- "0000000000000000000000000000000000000000000000000000000000000000\n"
    cat(str_0)
}

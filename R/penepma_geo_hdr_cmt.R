#' Create a header line with a comment
#' 
#' A helper function to create .geo files
#' 
#' @param str_cmt string. Example: "Cylindrical layers - distances all in cm"
#' 
#' @return none. Exports by cat to  console or file as set previously
#' 
#' @export
penepma_geo_hdr_cmt <- function(str_cmt){
    line <- sprintf("C  %s\n", str_cmt)
    cat(line)
}

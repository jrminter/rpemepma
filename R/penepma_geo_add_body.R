#' Add a body
#' 
#' A helper function to create .geo files
#' 
#' @param indx integer. Body number. Corresponde to material.
#' 
#' @param str_cmt string. A comment. Ex: top layer
#' 
#' @return none. Exports by cat to  console or file as set previously
#' 
#' @export
#'  
penepma_geo_add_body <- function(indx, str_cmt){
    penepma_geo_hdr_0() # start with zeros
    line <- sprintf("BODY    (   %d)   %s\n", indx, str_cmt)
    cat(line)
    line <- sprintf("MATERIAL(   %d)\n", indx)
    cat(line)
    line <- sprintf("SURFACE (   %d), SIDE POINTER=(-1)\n", indx)
    cat(line)
    line <- sprintf("SURFACE (   %d), SIDE POINTER=( 1)\n", indx+1)
    cat(line)
    line <-         "SURFACE (   5), SIDE POINTER=(-1)\n"
    cat(line)
}

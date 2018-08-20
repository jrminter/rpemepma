#' Add a cylindrical surface
#' 
#' A helper function to create penepma .geo files
#' 
#' @param indx integer. Surface number. Starts with 1. 
#' 
#' @param str_cmt string. A comment. Ex:  Cylinder, 1 cm radius
#' 
#' @param rad_cm The radius in cm Ex: 1.0.
#' 
#' @return none. Exports by cat to  console or file as set previously
#' 
#' @export
#' 
penepma_geo_add_surf_cyl <- function(indx, str_cmt, rad_cm){
    penepma_geo_hdr_0() # start with zeros
    line <- sprintf("SURFACE (   %s)   %s\n", indx, str_cmt)
    cat(line)
    cat("INDICES=( 1, 1, 0, 0,-1)\n")
    val <- sprintf("X-SCALE=(+%.15e,   0)              (DEFAULT=1.0)\n", rad_cm)
    cat(val)
    val <- sprintf("Y-SCALE=(+%.15e,   0)              (DEFAULT=1.0)\n", rad_cm)
    cat(val)
}

#' Add a Z surface
#' 
#' A helper function to create .geo files
#' 
#' @param indx integer. Surface number. Starts with 1. 
#' 
#' @param str_cmt string. A comment. Ex:  Plane Z=0 - surface plane
#' 
#' @param l_index list of 5 integer indices. Ex: c(0, 0, 0, 1, 0)
#' 
#' @param cum_z_shift_nm The CUMULATIVE z-shift of the plane in nm. Converted
#' to cm internally. These have negative values. Default is NA which is used
#' for the top surface that does not have a Z-shift.
#' @return none. Exports by cat to console or file as set previously
#' 
#' @export
#' 
penepma_geo_add_surf_z <- function(indx, str_cmt, l_index, cum_z_shift_nm){
    penepma_geo_hdr_0() # start with zeros
    line <- sprintf("SURFACE (   %s)   %s\n", indx, str_cmt)
    cat(line)
    s_indx <- sprintf("INDICES=( %g, %g, %g, %g, %g)\n", l_index[1],
                      l_index[2], l_index[3], l_index[4], l_index[5])
    cat(s_indx)
    if(!is.na(cum_z_shift_nm)){
        z_shift_cm = cum_z_shift_nm*1e-7
        val <-sprintf("Z-SHIFT=(%.15e,   0)\n", z_shift_cm)
        cat(val)
    }
}

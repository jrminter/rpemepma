#' Copy a list of files from simulation to analysis directory
#' 
#' PENEPMA generates many output data files durming a simulation. Often one
#' wants to analyze "on-the-fly". This function helps copy them to an anaysis
#' directory 
#'
#' @param in_dir String. The path to the simulation dir. ex: "~Desktop/sim"
#' 
#' @param out_dir String. The path to the anaysis dir. ex: "~Desktop/ana"
#' 
#' @param fi_spec String. A file specification. ex: "*-01.dat"
#' 
#' @param verbose Boolean, Default: FALSE. If TRUE print list of files.
#' 
#' @return none.
#'
#' @export
#'
penepma_copy_list_of_files <- function(in_dir, out_dir, fi_spec,
                                       verbose = FALSE){
    list_of_files <- list.files(sim_dir, fi_spec)
    if(verbose == TRUE){print(list_of_files)}
    lapply(list_of_files, function(x){
        in_file  <- sprintf("%s/%s", in_dir, x)
        out_file <- sprintf("%s/%s", out_dir, x)
        file.copy(in_file, out_file, overwrite = TRUE)})
}

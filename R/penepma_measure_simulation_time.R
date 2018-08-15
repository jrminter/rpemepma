#' Measure the simulation time of a penepma simulation
#' 
#' Measure the time difference between the creation time of the pe-material.dat
#' (not changed after the simulation starts) and the modification time of the
#' pe-spect-01.dat which is modified at the end of every sump time. We do this
#' in the simulation directory to preserve the file time stamps.
#'
#' @param sim_dir String. The path to the directory with the penepma simulation
#' files. Example: "C:/sim/penepma16/20-nm-C-250-nm-ZnO-Silica".
#'
#' @return the current simulation time. An integer of class "POSIXct"
#' 
#' @export
#' 
penepma_measure_simulation_time <- function(sim_dir){
  start_file <- sprintf("%s/pe-material.dat", sim_dir)
  end_file   <- sprintf("%s/pe-spect-01.dat", sim_dir)
  # Use creation time on start_file. This file is only wtitten at start.
  start_time <- file.info(start_file)$ctime
  # Use modifcation time on endfile_file
  # because it is over-written during simulation
  end_time   <- file.info(end_file)$mtime
  delta_t    <- end_time - start_time
  return(delta_t)
}

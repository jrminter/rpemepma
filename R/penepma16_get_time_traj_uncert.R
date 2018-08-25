#' Get the time, number of trajectories, and relative uncertainty from a
#' penepma16 simulation
#'
#' @param sim_dir The path to the directory with penepma.res file.
#' 
#' @return a tibble with the simulation time (sec), number of
#' trajectories, and the relative uncertainty of the REFLIN transition
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma16_get_time_traj_uncert <- function(sim_dir){
    path <- sprintf("%s/penepma-res.dat", sim_dir)
    print(path)
    con <- file(path)
    open(con)
    line_time <- read.table(con, skip =  6, nrow=1)[4] #  7th line
    traj      <- as.double(read.table(con, skip =  1, nrow=1)[5]) # 10th line
    rel_unc   <- read.table(con, skip = 41, nrow=1)[4] # 52nd line
    close(con)
    df <- data.frame(sim_time = line_time,
                     num_traj = traj,
                     rel_unc  = rel_unc)
    names(df) <- c("sim_time", "num_traj", "rel_unc")
    res <- tibble::as_tibble(df)
    return(res)
}

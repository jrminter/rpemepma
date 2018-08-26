#' Get the time, number of trajectories, and relative uncertainty from a
#' penepma16 simulation. Sometimes the lines in the file are shifted.
#'
#' @param sim_dir The path to the directory with penepma.res file.
#' 
#' @param skip_time An integer. The number of lines to skip to read the line
#' containing the simulation time. Default:6.
#' 
#' @param skip_traj An integer. The number of lines to skip to read the line
#' containing the number of trajectories, Default: 2 (additional lines).
#' 
#' @param skip_unc An integer. The number of lines to skip to read the line
#' with the uncertainty value. Default: 33 (additional lines).
#' 
#' @return a tibble with the simulation time (sec), number of
#' trajectories, and the relative uncertainty of the REFLIN transition
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma16_get_time_traj_uncert <- function(sim_dir,
                                          skip_time = 6,
                                          skip_traj = 2,
                                          skip_unc = 33){
    path <- sprintf("%s/penepma-res.dat", sim_dir)
    print(path)
    con <- file(path)
    open(con)
    # 7th line
    line_time <- read.table(con, skip = skip_time, nrow=1)[4] 
    # 10th line
    traj      <- as.double(read.table(con, skip = skip_traj, nrow=1)[5]) 
    # 44th line
    rel_unc   <- read.table(con, skip = skip_unc, nrow=1)[4] 
    close(con)
    df <- data.frame(sim_time = line_time,
                     num_traj = traj,
                     rel_unc  = rel_unc)
    names(df) <- c("sim_time_sec", "num_traj", "rel_unc")
    res <- tibble::as_tibble(df)
    return(res)
}

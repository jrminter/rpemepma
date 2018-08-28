#' Get the time, number of trajectories, and relative uncertainty from a
#' penepma16 simulation. Sometimes the lines in the file are shifted.
#'
#' @param sim_dir The path to the directory with penepma.res file.
#' 
#' @param skip_time An integer. The number of lines to skip to read the
#' line containing the simulation time. Default:6.
#' 
#' @param skip_traj An integer. The number of lines to skip to read the
#' line containing the number of trajectories, Default: 2
#' (additional lines).
#' 
#' @param skip_unc An integer. The number of lines to skip to read the
#' line with the uncertainty value. Default: 33 (additional lines).
#' 
#' @param min_lines An integer. Line limit to be considered a bad read.
#' fail gracefully, returning NAs that we can remove later.
#' 
#' @param clean A boolean. If TRUE, delete the work.dat file.
#' Default: FALSE 
#' 
#' @return a tibble with the simulation time (sec), number of
#' trajectories, and the relative uncertainty of the REFLIN transition
#' 
#' @import dplyr
#' 
#' @export
#' 
proc_penepma16_res <- function(sim_dir,
                               skip_time = 6,
                               skip_traj = 2,
                               skip_unc = 33,
                               min_lines = 10,
                               clean = FALSE){
    bas_fi <- sprintf("%s/penepma-res.dat", sim_dir)
    wrk_fi <- sprintf("%s/work.dat", sim_dir)
    # first, make a working copy
    file.copy(bas_fi, wrk_fi, overwrite = TRUE)
    con <- file(wrk_fi)
    n_lines <- length(readLines(con))
    close(con)
    if(n_lines < min_lines){
        # This was a bad read. Fail gracefully...
        # Return NA's and we can clean them out later...
        lt <- as.numeric(NA)
        nt <- as.numeric(NA)
        ru <- as.numeric(NA)
        print("Bad read. Too few lines. Fail gracefully. Remove NA's later...")
        df <- data.frame(sim_time = lt,
                         num_traj = nt,
                         rel_unc  = ru)
        names(df) <- c("sim_time_sec", "num_traj", "rel_unc")
        res <- tibble::as_tibble(df)
        file.remove(wrk_fi)
        return(res)
    }
    con <- file(wrk_fi)
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
    if(clean){
        file.remove(wrk_fi)
    }
    return(res)
}

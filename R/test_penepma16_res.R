#' Find the lines containing simulation time, number of trajectories,
#' and relative uncertainty from a penepma16 simulation. The lines in
#' the file are shifted, typically because of changes in the number of
#' detectors. Use this to find offsets for the function
#' proc_penepma16_res
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
#' @return None. Prints lines chosen.
#' 
#' @export
#' 

test_penepma16_res <- function(sim_dir,
                               skip_time = 6,
                               skip_traj = 2,
                               skip_unc = 33){
    path <- sprintf("%s/penepma-res.dat", sim_dir)
    print(path)
    con <- file(path)
    open(con)
    # 7th line
    line_time <- read.table(con, skip = skip_time, nrows=1)
    print(line_time)
    # 10th line
    traj      <- read.table(con, skip = skip_traj, nrows=1)
    print(traj)
    # 44th line
    rel_unc   <- read.table(con, skip = skip_unc, nrows=1)
    print(rel_unc)
    close(con)
}

#' Periodically poll the penepma-res.dat file and generate a tibble
#' containing the simulation time (in sec), the number of trajctories,
#' and the relative uncertainty. This is a wrapper for the function
#' proc_penepma16_res.
#' 
#' @param sim_dir The path to the directory with penepma.res file.
#' 
#' @param sleep_sec An integer. The number of sec between reading the
#' file. Set to the dump time for the simulation
#' 
#' @param max_iter An integer. The maximum number of iterations. Default
#' is 20000.
#' 
#' @param skip_time An integer. The number of lines to skip to read the
#' line containing the simulation time. Default:6.
#' 
#' @param skip_traj An integer. The number of lines to skip to read the
#' line containing the number of trajectories, Default: 2 (additional
#' lines).
#' 
#' @param skip_unc An integer. The number of lines to skip to read the
#' line with the uncertainty value. Default: 33 (additional lines). This
#' line changes frequently because of the change in number of detectors.
#' 
#' @param min_lines An integer. The minimum lines the file should have
#' to process. Helps if the file polled while penepma was writing. 
#' Default: 10.
#' 
#' @param clean A boolean. The underlying proc_penepma16_res copies the
#' penepma-res.dat file to work.dat. If TRUE, this file is deleted.
#' Default is FALSE.
#' 
#' @param verbose A boolean. Write messages when TRUE. Default is FALSE.
#' 
#' @export
#' 

poll_penepma16_res <- function(sim_dir,
                             sleep_sec = 120,
                             max_iter = 20000,
                             skip_time = 6,
                             skip_traj = 2,
                             skip_unc  = 33,
                             min_lines = 10,
                             clean = FALSE,
                             verbose = FALSE){
    fi_path <- sprintf("%s/penepma-res.dat", sim_dir)
    if(verbose==TRUE){print("starting")}
    for (i in seq(1:max_iter)){
        # first query of penepma-res.dat file 
        tib <- proc_penepma16_res(sim_dir,
                                  skip_time = skip_time,
                                  skip_traj = skip_traj,
                                  skip_unc  = skip_unc,
                                  min_lines = min_lines,
                                  clean = clean)
        if(i==1){
            # add the first line to output
            out <- tib
            sim_time_one <- tib$sim_time_sec
        } else {
            sim_time_one <- tib$sim_time_sec
            if(verbose==TRUE){print("sleep...")}
            Sys.sleep(sleep_sec)
            if(verbose==TRUE){print("awake...")}
            tib <- proc_penepma16_res(sim_dir,
                                      skip_time = skip_time,
                                      skip_traj = skip_traj,
                                      skip_unc  = skip_unc,
                                      min_lines = min_lines,
                                      clean = clean)
            sim_time_two <- tib$sim_time_sec
            if(sim_time_two > sim_time_one){
                if(verbose==TRUE){print("processing data...")}
                # process the data
                out <- rbind(out, tib)
                print(paste("i = ", i))
                print(tail(out, 10))
                
            } else{
                if(verbose==TRUE){print("break")}
                return(out)
            }
            
        }
    }
    if(verbose==TRUE){print("made it to end")}
    return(out)
}

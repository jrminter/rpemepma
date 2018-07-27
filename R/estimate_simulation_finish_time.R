#' Estimate the finish time for a simulation, given a prior estimate
#'
#' @param start_date A string with the starting date.
#'                   Example: "2018-07-27"
#' 
#' @param start_time A string with the starting time.
#'                   Example: "15:01:32"
#' 
#' @param base_hrs A number. Number of hrs for base simulation.
#'                 Example: 0
#' 
#' @param base_min A number. Number of min for base simulation.
#'                 Example: 10
#' 
#' @param base_sec A number. Number of sec for base simulation.
#'                 Example: 15
#' @param multiplier A number. The ratio based on parameterers.
#'                   Example: For 5X the trajectories use 5.0. 
#'
#' @return None. Prints estimated finish time
#'                   
#' @export
#'
#' @examples
#' library(rpenepma)
#' estimate_simulation_finish_time("2018-07-27", "15:01:32",
#'                                 0, 10, 15, 5.0)
#' 
estimate_simulation_finish_time <- function(start_date,
                                            start_time,
                                            base_hrs,
                                            base_min,
                                            base_sec,
                                            multiplier){
  dt1 <- strptime(paste(start_date, start_time),"%Y-%m-%d %H:%M:%S")
  deltaT <- multiplier * (3600*base_hrs + 60*base_min + base_sec)
  dt2 <- dt1 + deltaT
  print(dt2)
}

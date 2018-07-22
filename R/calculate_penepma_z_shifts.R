#' Calculate a list of penepma z-shifts given a list of layer spacings
#'
#' @param l_nm_shifts A list of layer thicknesses in nm.
#'                    Example c(20, 50, 100, 1.0e+07)
#'
#' @return l_cum_sum A list of the cumulative sum values. These are
#'                   printed with 15 digits to match penepma's output
#'                   
#' @export
#'
#' @examples
#' library(rpenepma)
#' # data
#' l_nm_shifts <- c(20, 50, 100, 1.0e+07)
#' l_cum_shifts_cm <- calculate_penepma_z_shifts(l_nm_shifts)
#' print(l_cum_shifts_cm)


calculate_penepma_z_shifts <- function(l_nm_shifts){
  l_cm_shifts <- 1.0e-07*l_nm_shifts
  l_cum_sum_shifts <- -1.0*cumsum(l_cm_shifts)
  l_cum_sum_shifts <- formatC(signif(l_cum_sum_shifts, 15),
                              format = "e", digits = 15)
  l_cum_sum_shifts
}

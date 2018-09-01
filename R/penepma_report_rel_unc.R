#' A tidy retrieval of the relative uncertainty of a transition from a
#' tibble/dataframe
#'
#' @param tib_in A tibble. This contains the intensity data. Usually created
#' with penepma_get_intensities()
#' 
#' @param z_val A number. The atomic number of the desired element. Ex: 29 (Cu)
#' 
#' @param val_s0 A number. The penepma value from Table 7.2 for the first shell
#' of the transition. Ex: K = 1, L3 = 5, M5 = 9.
#' 
#' @param val_s1 A number. The penepma value from Table 7.2 for the second shell
#' of the transition. (see example above or table 7.3)
#'
#' @return a tibble with a single row containing the relative uncertainty.
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_report_rel_unc <- function(tib_in, z_val, val_s0, val_s1){
  ret <- tib_in %>%
    select(IZ, S0, S1, Int.mu, Int.se) %>%
    filter(IZ == z_val, S0==val_s0, S1==val_s1) %>%
    mutate(rel_unc = Int.se/Int.mu) %>%
    select(rel_unc)
  
  return(ret)
}

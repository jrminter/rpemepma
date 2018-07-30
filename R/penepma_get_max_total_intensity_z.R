#' Retrieve the maximum total intensity qnd uncertqainty for an element
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#'
#' @return the transition and the maximum total intensity and uncertainty (a tibble)
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_max_total_intensity_z <- function(tib, z){
  rv <- tib %>%
    filter(IZ==z) %>%
    filter(Int.mu == max(Int.mu)) %>%
    select(IZ, S0, S1, Int.mu, Int.se)
  
  return(rv)
}

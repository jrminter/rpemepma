#' Retrieve the maximum primary intensity and uncertainty for an element
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#'
#' @return the transition and both the maximum primary intensity and uncertainty (a tibble)
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_max_primary_intensity_z <- function(tib, z){
  rv <- tib %>%
    filter(IZ==z) %>%
    filter(P.mu == max(P.mu)) %>%
    select(IZ, S0, S1, P.mu, P.se)
  
  return(rv)
}
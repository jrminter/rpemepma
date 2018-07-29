#' Retrieve the maximum intensity for an element
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#'
#' @return the intensities transition with the maximum primary intensity (a tibble)
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

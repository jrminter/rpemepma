#' Retrieve the maximum primary intensity and uncertainty for an element
#' and calculate the SNR
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#'
#' @return A tibble. The transition, maximum primary intensity, uncertainty, and SNR.
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_max_primary_intensity_z <- function(tib, z){
  rv <- tib %>%
    filter(IZ==z) %>%
    filter(P.mu == max(P.mu)) %>%
    select(IZ, S0, S1, P.mu, P.se) %>%
    mutate(P.snr=P.mu/P.se)
  nr <- nrow(rv)
  sym <- get_atomic_symbol_from_z(z)
  sym <- rep(sym, nr)
  rv <- tibble::add_column(rv, Symbol=sym) %>%
    # reorder columns
    select(Symbol, IZ, S0, S1, P.mu, P.se, P.snr)
  return(rv)
}

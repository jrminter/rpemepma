#' Retrieve the maximum total intensity qnd uncertqainty for an element
#' and calculate the SNR.
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#'
#' @return A tibble. The transition, maximum total intensity, uncertainty, and SNR.
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_max_total_intensity_z <- function(tib, z){
  rv <- tib %>%
    filter(IZ==z) %>%
    filter(Int.mu == max(Int.mu)) %>%
    select(IZ, S0, S1, Int.mu, Int.se) %>%
    mutate(Int.snr=Int.mu/Int.se)
  nr <- nrow(rv)
  sym <- get_atomic_symbol_from_z(z)
  sym <- rep(sym, nr)
  rv <- tibble::add_column(rv, Symbol=sym) %>%
    # reorder columns
    select(Symbol, IZ, S0, S1, Int.mu, Int.se, Int.snr)
  
  return(rv)
}

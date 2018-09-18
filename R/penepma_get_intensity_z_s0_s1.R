#' Retrieve the intensity and uncertainty for a specified transition for an
#' element and calculate the SNR. Adds the atomic symbol to the return.
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#' 
#' @param s0 The number for the originating shell from Table 7.2. Ex: 1 for K.
#' 
#' @param s1 The number for the filling shel lfrom Table 7.2. Ex: 4 for L3.
#'
#' @return A tibble. The Symbol, atomic number, S0, S1, mean intensity,
#'         mean intensity std error,and mean intensity SNR.
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_intensity_z_s0_s1 <- function(tib, z, s0, s1){
  rv <- tib %>%
    filter(IZ==z) %>%
    filter(S0==s0) %>%
    filter(S1==s1) %>%
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

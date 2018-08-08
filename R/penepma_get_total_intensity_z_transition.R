#' Retrieve the maximum total intensity qnd uncertqainty for an element
#' and calculate the SNR.
#'
#' @param tib A tibble. The tibble with the intensities from a penepma spectrum
#' 
#' @param z The atomic number for an element
#'
#' @param trans_1 A string. The first shell of the transition. Example: "K"
#'
#' @param trans_2 A string. The second shell of the transition. Example: "L3"
#'
#' @return A tibble. The symbol, Z, S0, S1, maximum total intensity, uncertainty, and SNR.
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_total_intensity_z_transition <- function(tib, z, trans_1, trans_2){
  rv <- tib %>%
    filter(IZ==z) %>%
    filter(S0==as.character(trans_1)) %>%
    filter(S1==as.character(trans_2)) %>%
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

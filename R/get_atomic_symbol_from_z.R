#' Get the atomic symbol from Z
#'
#' @param z The atomic number for an element
#'
#' @return A string. Atomic symbol
#' 
#' @import dplyr
#' 
#' @export
#' 

get_atomic_symbol_from_z <- function(z){
  data("elemental_densities")
  rv <- elemental_densities %>%
    filter(Z==z) %>%
    filter(row_number()==1) %>%
    select(Symbol)
  as.character(rv)
}

# res <- get_atomic_symbol_from_z(6)
# print(res)

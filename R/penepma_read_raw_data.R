#' Retrieve the raw channel data from a PENEPMA spectrum
#'
#' @param fi String. The path to the file. ex: "./pe-spect-01.dat"
#' 
#' @return a tibble
#' 
#' @import dplyr
#' 
#' @importFrom utils read.table
#'
#' @export
#'
penepma_read_raw_data <- function(fi){
  df <- read.table(fi, sep=" ", skip=12)
  # thanks, stackoverflow
  # https://stackoverflow.com/questions/2643939/remove-columns-from-dataframe-where-all-values-are-na
  df <- df[,colSums(is.na(df))<nrow(df)]
  names(df) <- c("eV", "pd.mu", "pd.unc")
  df <- as_tibble(df) %>%
        filter(pd.mu > 1.000000e-35) %>%
        mutate(keV = eV*1.0e-3) %>%
        select(keV, pd.mu, pd.unc)
  return(df)
}

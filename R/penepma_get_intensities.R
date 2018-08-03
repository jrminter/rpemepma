#' Retrieve the intensities from a PENEPMA spectrum
#'
#' @param fi String. The path to the file. ex: "./pe-spect-01.dat"
#'
#' @return the intensities (a tibble)
#' 
#' @import dplyr
#' 
#' @export
#' 
penepma_get_intensities <- function(fi){
  x <- readLines(fi, 13)[13]
  y <- strsplit(x, " ") #[[1]][7])
  y <- unlist(lapply(y, function(x) x[nchar(x) > 0]))[-1]
  y <- y[-4]
  df <- read.table(fi, sep = "" , header = F , skip=13)
  names(df) <- y
  names(df)[4] <- 'eV'
  df$eV <- df$eV/1000.
  # df$IZ <- as.integer(df$IZ)
  # names(df)[4] <- 'keV'
  names(df) <- c("IZ", "S0", "S1", "keV", "P.mu", "P.se", "C.mu", "C.se",
                 "B.mu", "B.se", "TF.mu", "TF.se", "Int.mu", "Int.se")
  df <- as_tibble(df)
  return(df)
}

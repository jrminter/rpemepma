#' Retrieve the raw channel data from a PENEPMA spectrum
#'
#' @param fi String. The path to the file. ex: "./pe-spect-01.dat"
#' 
#' @param min_intensity_clip numeric. The minimum value to clip the intensity. Default: 1.0e-12.
#' 
#' @param int_scale_factor numeric. Intensity scale factor. Default: 1.0e9.
#' 
#' @return a tibble
#' 
#' @import ramify
#' 
#' @import dplyr
#' 
#' @importFrom utils read.table
#'
#' @export
#'
penepma_read_raw_data <- function(fi,
                                  min_intensity_clip=1.0e-12,
                                  int_scale_factor=1.0e9){
  df <- read.table(fi, sep=" ", skip=12)
  df <- df[, -c(1,2,3) ]
  df <- df[, -c(2, 4)]
  names(df) <- c('ev', 'mu', 'se')
  df$ev <- df$ev/1000.
  names(df) <- c('keV', 'mu', 'se') # make keV

  mv <- max(df$mu)
  df$mu <- clip(df$mu, .min = min_intensity_clip, .max = mv)
  df$mu <- 1e9*df$mu
  mv <- max(df$se)
  df$se <- clip(df$se, .min = min_intensity_clip, .max = mv)
  df$se <- 1e9*df$se
  return(as_tibble(df))
}

#' Retrieve the spectrum information from a PENEPMA spectrum
#' 
#' @param fi String. The path to the file. ex: "./pe-spect-01.dat"
#' 
#' @return a tibble with the e_start_eV, e_end_eV, n_channels and ev_per_ch
#' 
#' @import dplyr
#' 
#' @export
#' 
get_penepma_spectra_info <-  function(fi){
  line <- readLines(fi, 5)[5]
  e_start <- strsplit(line, " ")[[1]][8]
  e_start <-as.numeric(strsplit(e_start, ",")[[1]][1])
  e_end <- strsplit(line, " ")[[1]][9]
  e_end <- as.numeric(strsplit(e_end,")")[[1]][1])
  n_channels <- as.numeric(strsplit(line, " ")[[1]][15])
  ev_per_ch <- readLines(fi, 6)[6]
  ev_per_ch <- as.numeric(strsplit(ev_per_ch, " ")[[1]][7])
  ret <- data.frame(e_start=e_start, e_end=e_end,
                    n_channels=n_channels, ev_per_ch=ev_per_ch)
  names(ret) <- c("e_start_eV", "e_end_eV", "n_channels", "ev_per_ch")
  return(as_tibble(ret))
}

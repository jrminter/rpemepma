#' Calculate the k-ratio from penepma intensities
#'
#' Calculate the k-ratio for a desired transition from R tibbles that
#' contain intensity data. Also compute the uncertainty and relative
#' uncertainty.
#'
#' @param str_samp A string to describe the sample. Ex: "200 nm C on Fe"
#' @param str_kr A string to describe the K-ratio Ex: "C Ka"
#' @param tib_unk A tibble containing the penepma intensity data for
#' the unknown.
#' @param tib_std A tibble comtaining the penepma intensity data for
#' the standard.
#' @param z The atomic number for the element for the K-ratio.
#' Ex: 6 for C.
#' @param s0 The number for the originating shell from Table 7.2.
#' Ex: 1 for K.
#' @param s1 The number for the filling shell from Table 7.2.
#' Ex: 4 for L3.
#' @param n_rnd The number of digits to round values. Default: 5.
#'
#' @return A tibble containing the kratio and the uncertainty
#'
#' @import dplyr
#'
#' @export
penepma_calc_k_ratio <- function(str_samp, str_kr, tib_unk, tib_std,
                                 z, s0, s1, n_rnd=5){
  unk_int <- tib_unk %>%
    filter(IZ==z) %>%
    filter(S0==s0) %>%
    filter(S1==s1) %>%
    select(Int.mu, Int.se)

  std_int <- tib_std %>%
    filter(IZ==z) %>%
    filter(S0==s0) %>%
    filter(S1==s1) %>%
    select(Int.mu, Int.se)

  # calculate the mean k-ratio
  k_r_mu <- round((unk_int$Int.mu / std_int$Int.mu), n_rnd)

  # negelecting covariance here... Calculate uncertainty
  unc_cont <- (unk_int$Int.se/unk_int$Int.mu)^2
  std_cont <- (std_int$Int.se/std_int$Int.mu)^2
  k_r_unc <- k_r_mu * sqrt(unc_cont + std_cont)
  k_r_unc <- round(k_r_unc, n_rnd)
  kr_rel_unc <- round(100.0*k_r_unc/k_r_mu, 1)
  k_ratio <- data.frame(sample=as.character(str_samp),
                        k_r=as.character(str_kr),
                        mean=k_r_mu,
                        unc=k_r_unc,
                        pct_unc=kr_rel_unc)

  return(k_ratio)
}

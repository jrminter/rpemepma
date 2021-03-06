% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/penepma_get_total_intensity_z_transition.R
\name{penepma_get_total_intensity_z_transition}
\alias{penepma_get_total_intensity_z_transition}
\title{Retrieve the maximum total intensity qnd uncertqainty for an element
and calculate the SNR.}
\usage{
penepma_get_total_intensity_z_transition(tib, z, trans_1, trans_2)
}
\arguments{
\item{tib}{A tibble. The tibble with the intensities from a penepma spectrum}

\item{z}{The atomic number for an element}

\item{trans_1}{A string. The first shell of the transition. Example: "K"}

\item{trans_2}{A string. The second shell of the transition. Example: "L3"}
}
\value{
A tibble. The symbol, Z, S0, S1, maximum total intensity, uncertainty, and SNR.
}
\description{
Retrieve the maximum total intensity qnd uncertqainty for an element
and calculate the SNR.
}

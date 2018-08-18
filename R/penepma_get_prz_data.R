#' Retrieve the phi rho z data from a line in a penepma simulation
#' 
#' Read the data from the pe-prz-140104-01 file . In this case 14 ia the atomic
#' number (Si) 01 indicates a K shell and 04 inficates an L3 shell. The 01 
#' signifies detector 1.
#'
#' @param fi String. The path to the pe-prz-140104-01.dat file.
#' ex: "./ pe-prz-140104-0.dat"
#'
#' @return A tibble with the prz data. There is a lot of data for post-processing
#' 
#' @import tibble
#'
#' @export
#' 
penepma_get_prz_data <- function(fi){
    library(rpenepma)
    df <- read.table(fi, sep=" ", skip=17)
    # thanks, stackoverflow
    # https://stackoverflow.com/questions/2643939/remove-columns-from-dataframe-where-all-values-are-na
    df <- df[,colSums(is.na(df))<nrow(df)]
    names(df) <- c("D.cm", "DF.cm", "PE.mu", "PE.unc", "PG.mu", "PG.unc",
                   "CE.mu", "CE.unc", "CG.mu", "CG.unc", "BE.mu", "BE.unc",
                   "BG.mu", "BG.unc", "TFE.mu", "TFE.unc", "TFG.mu", "TFG.unc",
                   "TE.mu", "TE.unc", "TG.mu", "TG.unc")
    
    return(as_tibble(df))
}


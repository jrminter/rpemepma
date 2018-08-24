#' penepma16_read_map_data - read the pe-map-0#-depth.dat file
#' and return a tibble with data values
#' 
#' A helper function for processing map data
#' 
#' @param fi A string. the path to the desired file, ex: './pe-map-01-depth.dat'
#' 
#' @return A tibble with depth [nm], dens.mu (mean) and dens.unc (std.error)
#' 
#' @export
#' 
penepma16_read_map_data <- function(fi){
    df <- read.table(fi, sep=" ", skip=12)
    # thanks, stackoverflow
    # https://stackoverflow.com/questions/2643939/remove-columns-from-dataframe-where-all-values-are-na
    df <- df[,colSums(is.na(df))<nrow(df)]
    names(df) <- c("cm", "dens.mu", "dens.unc")
    df <- as_tibble(df) %>%
        mutate(nm = cm*1.0e7) %>%
        select(nm, dens.mu, dens.unc)
    return(df)
}

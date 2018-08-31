#' Get the data we need to plot a prz curve
#' 
#' Use penepma_get_prz_data() to get the data, make the data tidy by converting
#' distances to nm and extracting just the data we need.
#' 
#' @param sim_dir String. The directory containing the prz file.
#'
#' @param prz_fi_name String. The name of the prz file WITHOUT the .dat ext.
#' ex: "pe-prz-140104-01"
#'
#' @return A tibble with the prz data. This can be plotted using R. The function
#' will also write a file to the simulation directory suitable for processing
#' with gnuplot for a quick graph.
#' 
#' @import tibble
#'
#' @export
#' 
prz_wrapper <- function(sim_dir, prz_fi_name){
    prz_fi_in  <- sprintf("%s/%s.dat", sim_dir, prz_fi_name)
    prz_fi_out <- sprintf("%s/%s-gp.dat", sim_dir, prz_fi_name)
    ret <- penepma_get_prz_data(prz_fi_in) %>% 
        select(D.cm, DF.cm, TE.mu, TE.unc, TG.mu, TG.unc) %>%
        mutate(D.nm = D.cm*1.0e7) %>%
        mutate(DF.nm = DF.cm*1.0e7) %>%
        select(D.nm, DF.nm, TE.mu, TE.unc, TG.mu, TG.unc) %>%
        filter(TE.mu > 0)
    
    # write the table 
    ret %>%
        write.table(., file = prz_fi_out, sep =" ", row.names = FALSE)
    # return the tibble
    return(ret)
}




#' Plot Magnetic Susptibility Ensemble
#'
#' This function plots the bulk density ensemble.
#' @param map_ms Data frame containing the bulk density ensemble data.
#' @return A ggplot object representing the bulk density ensemble plot.
#' @importFrom geoChronR selectData plotTimeseriesEnsRibbons
#' @import ggplot2
#' @export
plot_ms_ens <- function(map_ms) {
  if (!requireNamespace("geoChronR", quietly = TRUE)) {
    stop("geoChronR package is required for this function.")
  }

  ms <- geoChronR::selectData(map_ms, var.name = "ageEnsemble", meas.table.num = 4)
  ms_ms <- geoChronR::selectData(map_ms, var.name = "MS", meas.table.num = 4)

  ms_plot <- geoChronR::plotTimeseriesEnsRibbons(X = ms, Y = ms_ms, probs = c(0.25, 0.5, 0.75), color.line = "red3") +
    coord_flip() +
    scale_x_reverse() +
    theme_classic() +
    labs(x = "Age (Cal bp)", y = "MS (SI)")
  print(ms_plot)

  return(ms_plot)
}

#' Plot Biogenic Silica Ensemble
#'
#' This function plots the BSi ensemble.
#' @param map_bsi Data frame containing the BSi ensemble data.
#' @return A ggplot object representing the BSi ensemble plot.
#' @importFrom geoChronR selectData plotTimeseriesEnsRibbons
#' @import ggplot2
#' @export
plot_bsi_ens <- function(map_bsi) {
  if (!requireNamespace("geoChronR", quietly = TRUE)) {
    stop("geoChronR package is required for this function.")
  }

  bsi <- geoChronR::selectData(map_bsi, var.name = "ageEnsemble", meas.table.num = 5)
  bsi_bsi <- geoChronR::selectData(map_bsi, var.name = "BSi", meas.table.num = 5)

  bsi_plot <- geoChronR::plotTimeseriesEnsRibbons(X = bsi, Y = bsi_bsi, probs = c(0.25, 0.5, 0.75), color.line = "purple4") +
    coord_flip() +
    scale_x_reverse() +
    theme_classic() +
    labs(x = "Age (Cal bp)", y = "BSi (%)")

  print(bsi_plot)

  return(bsi_plot)
}

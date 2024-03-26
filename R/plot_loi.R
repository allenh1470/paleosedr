#' Plot LOI Ensemble
#'
#' This function plots the LOI ensemble.
#' @param map_loi Data frame containing the LOI ensemble data.
#' @return A ggplot object representing the LOI ensemble plot.
#' @importFrom geoChronR selectData plotTimeseriesEnsRibbons
#' @import ggplot2
#' @export
plot_loi_ens <- function(map_loi) {
  if (!requireNamespace("geoChronR", quietly = TRUE)) {
    stop("geoChronR package is required for this function.")
  }

  loi <- geoChronR::selectData(map_loi, var.name = "ageEnsemble", meas.table.num = 2)
  loi_loi <- geoChronR::selectData(map_loi, var.name = "LOI", meas.table.num = 2)

  loi_plot <- geoChronR::plotTimeseriesEnsRibbons(X = loi, Y = loi_loi, probs = c(0.25, 0.5, 0.75), color.line = "darkgreen") +
    coord_flip() +
    scale_x_reverse() +
    theme_classic() +
    labs(x = "Age (Cal bp)", y = "LOI (%)")

  print(loi_plot)

  return(loi_plot)
}

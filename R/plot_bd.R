#' Plot Bulk Density Ensemble
#'
#' This function plots the bulk density ensemble.
#' @param map_bd Data frame containing the bulk density ensemble data.
#' @return A ggplot object representing the bulk density ensemble plot.
#' @importFrom geoChronR selectData plotTimeseriesEnsRibbons
#' @import ggplot2
#' @export
plot_bd_ens <- function(map_bd) {
  if (!requireNamespace("geoChronR", quietly = TRUE)) {
    stop("geoChronR package is required for this function.")
  }

  bd <- geoChronR::selectData(map_bd, var.name = "ageEnsemble", meas.table.num = 3)
  bd_bd <- geoChronR::selectData(map_bd, var.name = "bulkDensity", meas.table.num = 3)

  bd_plot <- geoChronR::plotTimeseriesEnsRibbons(X = bd, Y = bd_bd, probs = c(0.25, 0.5, 0.75), color.line = "tan2") +
    coord_flip() +
    scale_x_reverse() +
    theme_classic() +
    labs(x = "Age (Cal bp)", y = "BD (g/cm^3)")
  print(bd_plot)

  return(bd_plot)
}

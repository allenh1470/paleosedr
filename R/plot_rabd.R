#' Plot RABD Ensemble
#'
#' This function plots the RABD ensemble.
#' @param map_rabd Data frame containing the RABD ensemble data.
#' @return A ggplot object representing the RABD ensemble plot.
#' @importFrom geoChronR selectData plotTimeseriesEnsRibbons
#' @import ggplot2
#' @export
plot_rabd_ens <- function(map_rabd) {
  if (!requireNamespace("geoChronR", quietly = TRUE)) {
    stop("geoChronR package is required for this function.")
  }

  rabd <- geoChronR::selectData(map_rabd, var.name = "ageEnsemble", meas.table.num = 1)
  rabd_rabd <- geoChronR::selectData(map_rabd, var.name = "RABD660670", meas.table.num = 1)

  rabd_plot <- geoChronR::plotTimeseriesEnsRibbons(X = rabd, Y = rabd_rabd, probs = c(0.25, 0.5, 0.75), color.line = "lightgreen") +
    coord_flip() +
    scale_x_reverse() +
    theme_classic() +
    labs(x = "Age (cal yr BP)", y = "RABD660-670")

  print(rabd_plot)

  return(rabd_plot)
}

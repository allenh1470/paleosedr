#' Plot Age Model
#'
#' This function generates a plot of age model using plotChronEns from geoChronR.
#' @param age_model An object obtained from age modeling.
#' @return A ggplot object representing the age model plot.
#' @importFrom geoChronR plotChronEns
#' @import ggplot2
#' @export
plot_age_model <- function(age_model) {
  # Create the plot using plotChronEns function
  plot <- geoChronR::plotChronEns(age_model) +
    scale_x_reverse() +
    theme(panel.grid = element_blank(), legend.position = "none") +
    labs(x = "Age (cal yr BP)", y = "Depth (cm)") +
    ggtitle(NULL)

  return(plot)
}

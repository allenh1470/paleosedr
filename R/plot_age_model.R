#' Plot Age Model
#'
#' This function generates a plot of age model using plotChronEns from geoChronR.
#' @param age_model An object obtained from age modeling.
#' @param x_breaks Breaks for the x-axis.
#' @param x_labels Labels for the x-axis corresponding to the breaks.
#' @param y_breaks Breaks for the y-axis.
#' @param y_labels Labels for the y-axis corresponding to the breaks.
#' @return A ggplot object representing the age model plot.
#' @importFrom geoChronR plotChronEns
#' @import ggplot2
#' @export
plot_age_model <- function(age_model, x_breaks = NULL, x_labels = NULL, y_breaks = NULL, y_labels = NULL) {
  # Create the plot using plotChronEns function
  plot <- geoChronR::plotChronEns(age_model) +
    if (!is.null(x_breaks) && !is.null(x_labels)) {
      scale_x_reverse(breaks = x_breaks, labels = x_labels)
    } else NULL +
    if (!is.null(y_breaks) && !is.null(y_labels)) {
      scale_y_reverse(breaks = y_breaks, labels = y_labels)
    } else NULL +
    theme(panel.grid = element_blank(), legend.position = "none") +
    labs(x = "Age (Cal BP)", y = "Depth (cm)") +
    ggtitle(NULL)

  return(plot)
}

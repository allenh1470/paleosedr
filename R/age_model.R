#' Plot Age Model
#'
#' This function generates a plot using the age model data.
#' @param eklutna_age The age model data frame.
#' @return A ggplot object representing the age model plot.
#' @import ggplot2
#' @export
plot_age_model <- function(eklutna_age) {
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("ggplot2 package is required for this function.")
  }

  age_model <- plotChronEns(eklutna_age) +
    scale_x_reverse() +
    scale_y_reverse() +
    theme(panel.grid = element_blank(), legend.position = "none") +
    labs(x = "Age (Cal ka BP)", y = "Depth (cm)") +
    ggtitle(NULL)

  return(age_model)
}

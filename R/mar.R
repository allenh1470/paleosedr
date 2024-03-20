#' Get MAR Sheet from Loaded Data and Plot
#'
#' This function retrieves the Excel sheet called "mar" from the all_data list
#' and plots the mass accumulation rate.
#' @param all_data A list containing data frames from each Excel sheet.
#' @param x_breaks Breaks for the x-axis.
#' @param x_labels Labels for the x-axis corresponding to the breaks.
#' @return The mar data frame.
#' @import ggplot2
#' @export
get_mar_sheet <- function(all_data, x_breaks = NULL, x_labels = NULL) {
  if (!is.list(all_data)) {
    stop("Input must be a list.")
  }

  if (!"mar" %in% names(all_data)) {
    stop("The 'mar' sheet does not exist in the provided data.")
  }

  mar_data <- all_data[["mar"]]

  mar_plot <- ggplot(mar_data, aes(x = age, y = mar_g_cm_yr)) +
    geom_line(color = "tan4", size = 0.75) +
    coord_flip() +
    scale_x_reverse(
      breaks = x_breaks,
      labels = x_labels
    ) +
    theme_classic() +
    labs(x = "Age (Cal ka bp)", y = "MAR (g/cm^2/yr)")

  print(mar_plot)

  return(mar_data)
}

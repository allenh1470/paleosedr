#' Get MAR Sheet from Loaded Data and Plot
#'
#' This function retrieves the Excel sheet called "mar" from the all_data list
#' and plots the mass accumulation rate.
#' @param all_data A list containing data frames from each Excel sheet.
#' @return The mar data frame.
#' @import ggplot2
#' @export
get_mar_sheet <- function(all_data) {
  if (!is.list(all_data)) {
    stop("Input must be a list.")
  }

  if (!"mar" %in% names(all_data)) {
    stop("The 'mar' sheet does not exist in the provided data.")
  }

  mar_data <- all_data[["mar"]]

  mar_plot <- ggplot(mar_data, aes(x = age_cal_bp_yr, y = mar_g_cm_yr)) +
    geom_line(color = "tan4", size = 0.75) +
    coord_flip() +
    scale_x_reverse() +  # No breaks specified
    theme_classic() +
    labs(x = "Age (cal yr BP)", y = "MAR (g/cm^2/yr)")

  print(mar_plot)

  return(mar_data)
}

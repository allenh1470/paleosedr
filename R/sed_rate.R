#' Get Sed Rate Sheet from Loaded Data and Plot
#'
#' This function retrieves the Excel sheet called "sed_rate" from the all_data list
#' and plots the sedimentation rate.
#' @param all_data A list containing data frames from each Excel sheet.
#' @return The sed_rate data frame.
#' @import ggplot2
#' @export
get_sed_rate_sheet <- function(all_data) {
  if (!is.list(all_data)) {
    stop("Input must be a list.")
  }

  if (!"sed_rate" %in% names(all_data)) {
    stop("The 'sed_rate' sheet does not exist in the provided data.")
  }

  sed_rate_data <- all_data[["sed_rate"]]

  sed_rate_plot <- ggplot(sed_rate_data, aes(x = age_cal_bp_yr, y = sed_rate_cm_yr)) +
    geom_line(color = "yellow4", size = 0.75) +
    coord_flip() +
    scale_x_reverse() +
    theme_classic() +
    labs(x = "Age (cal yr BP)", y = "Sed. Rate (cm/yr)")

  print(sed_rate_plot)

  return(sed_rate_data)
}

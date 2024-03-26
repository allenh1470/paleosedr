#' Get Heatmap Data
#'
#' This function retrieves and prepares data for generating a heatmap.
#' @param all_data A list containing data frames from each Excel sheet.
#' @return A data frame ready for generating a heatmap.
#' @importFrom dplyr inner_join
#' @importFrom tidyr pivot_longer
#' @export
get_heatmap_data <- function(all_data) {
  if (!is.list(all_data)) {
    stop("Input must be a list.")
  }

  if (!"psa" %in% names(all_data)) {
    stop("The 'psa' data frame does not exist in the provided data.")
  }

  heat_map <- all_data[["psa"]]

  # Joining the data frame with itself
  heat_map <- inner_join(heat_map, heat_map, by = c("depth_cm" = "age_model_depth"))

  # Reshaping the data frame
  melted_df <- tidyr::pivot_longer(heat_map, cols = c(5:129), names_to = "binned_size", values_to = "abundance")
  melted_df <- melted_df %>%
    dplyr::mutate(binned_size = sub("\\.x$", "", binned_size))

  return(melted_df)
}

#' Generate PSA Heatmap
#'
#' This function generates a heatmap of PSA distribution.
#' @param melted_df A data frame containing melted PSA data.
#' @return A ggplot object representing the PSA heatmap.
#' @import ggplot2
#' @export
psa_heatmap <- function(melted_df) {
  if (!is.data.frame(melted_df)) {
    stop("Input must be a data frame.")
  }

  heat_map <- ggplot(melted_df, aes(x = age.y, y = as.numeric(binned_size), z = abundance)) +
    geom_contour_filled() +
    labs(title = "Eklutna PSA Distribution",
         x = "Age (cal yr BP)",
         y = "Particle Size (µm)",
         fill = "Abundance") +
    coord_flip() +
    theme_classic() +
    scale_x_reverse()

  return(heat_map)
}

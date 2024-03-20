#' Age Model Using Bacon
#'
#' This function performs age modeling using the Bacon algorithm.
#' @param data A data frame containing the necessary columns for age modeling.
#' @return A list containing the age model results.
#' @importFrom geoChronR runBacon
#' @export
age_model <- function(data) {
  # Check if necessary columns are present in the data frame
  if (!all(c("age", "depth") %in% colnames(data))) {
    stop("Data frame must contain 'age' and 'depth' columns.")
  }

  # Run Bacon algorithm
  result <- geoChronR::runBacon(data)

  return(result)
}

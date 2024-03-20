#' Import Data from LiPD File
#'
#' This function imports data from a LiPD (Linked Paleo Data) file.
#' @param file_path Path to the LiPD file.
#' @return A data frame containing the imported data.
#' @import lipdR
#' @export
import_lipd <- function(file_path) {
  # Check if the file exists
  if (!file.exists(file_path)) {
    stop("File not found.")
  }

  # Extract lake name and last name from the file name
  file_name <- basename(file_path)
  name_parts <- strsplit(file_name, "\\.")[[1]]
  lake_name <- name_parts[1]
  last_name <- name_parts[2]

  # Import data using lipdR::readLipd
  data <- lipdR::readLipd(file_path)

  return(data)
}

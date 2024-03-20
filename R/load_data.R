#' Load Paleo Data from Excel File
#'
#' This function loads paleoclimate data from an Excel file.
#' @param excel_file Path to the Excel file.
#' @return A list containing data frames from each sheet in the Excel file.
#' @import readxl
#' @export
load_paleo_data <- function(excel_file) {
  # Check if the file exists
  if (!file.exists(excel_file)) {
    stop("File not found.")
  }

  # Extract date and lake name from file name
  file_parts <- strsplit(basename(excel_file), "_")[[1]]
  date <- file_parts[1]
  lake_name <- file_parts[2]

  # Get sheet names
  sheet_names <- readxl::excel_sheets(excel_file)

  # Initialize an empty list to store data
  all_data <- list()

  # Read data from each sheet and store it in the list
  for (sheet_name in sheet_names) {
    data <- readxl::read_excel(excel_file, sheet = sheet_name)
    all_data[[sheet_name]] <- data
  }

  return(all_data)
}

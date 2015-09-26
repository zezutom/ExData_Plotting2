####
# Functionality common to all plots: data sets, formatting
####

# Creates a publicly available dataframe variable and populates it with data
# Params:
# x         variable name
# filename  data source
load_data <- function(x, filename) {
  if (!exists(x) || is.null(get(x))) {
    assign(x, readRDS(file.path("data", filename)), envir = globalenv())
  }
}

load_data("NEI", "summarySCC_PM25.rds")
load_data("SCC", "Source_Classification_Code.rds")

# Overrides scientific format on the y-axis in plots
options("scipen" = 20)
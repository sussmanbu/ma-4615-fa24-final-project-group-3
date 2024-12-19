suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(readr)))
suppressWarnings(suppressMessages(library(dplyr)))
#suppressWarnings(suppressMessages(library(here)))

# Loading in the data
suppressWarnings(suppressMessages({
  SAT_data <- read_csv(here::here("dataset-ignore", "tabn173.csv"))
}))

# Specifying columns to keep based on the indices provided
table_col_indices <- c(1, 16, 17)

# Selecting the columns based on index
SAT_data <- SAT_data[, table_col_indices]

# Renaming the selected columns by their indices
colnames(SAT_data) <- c(
  "Income_Bracket",
  "Critical_Reading_Score",  # 16th column
  "Math_Score"               # 17th column
)

# Selecting rows 88 to 97 inclusive
row_indices <- 88:97
SAT_data <- SAT_data[row_indices, ]

# Renaming rows based on their index positions (row indices)
row_names <- c(
  "Less_than_$20000",
  "$20000_to_$40000",
  "$40000_to_$60000",
  "$60000_to_$80000",
  "$80000_to_$100000",
  "$100000_to_$120000",
  "$120000_to_$140000",
  "$140000_to_$160000",
  "$160000_to_$200000",
  "More_than_$200000"
)

# Assigning the new row names
rownames(SAT_data) <- row_names

# Saving the cleaned data
write_rds(SAT_data, file = here::here("scripts", "SAT_data_cleaned.rds"))




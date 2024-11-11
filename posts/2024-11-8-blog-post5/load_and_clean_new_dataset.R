library(tidyverse)
library(dplyr)

# load the current dataset
education_cohort_data_institution <- read_rds("dataset/education_cohort_data_cleaned.rds")

# load the new dataset that will be combined
education_cohort_data_fields_of_study <- read_csv(here::here("dataset-ignore", "Most-Recent-Cohorts-Field-of-Study.csv"))

# filter the new dataset
education_cohort_data_fields_of_study_cleaned = education_cohort_data_fields_of_study |>
  select(
    'INSTNM',
    'EARN_COUNT_WNE_5YR', # Number of graduates working and not enrolled 5 year after completing
    'EARN_MDN_5YR', # Median earnings of graduates working and not enrolled 5 year after completing
    'CIPDESC', # Text description of the field of study CIP Code
    'CREDDESC', # Text description of the level of credential
  )

# output the new cleaned dataset
write_rds(education_cohort_data_fields_of_study_cleaned, file = here::here("dataset", "education_cohort_data_fields_of_study_cleaned.rds")) 

# Combine: perform an inner join on 'INSTNM' to ensure only matching rows are kept
education_cohort_combined_data <- merge(education_cohort_data_fields_of_study_cleaned, 
                       education_cohort_data_institution, 
                       by = "INSTNM", 
                       all = FALSE)

# Drop some columns
education_cohort_combined_data =  education_cohort_combined_data |>
  select(-starts_with("C150"),
         matches("SAT.*MID|ACT.*MID"),
         NPT41_PUB, NPT42_PUB, NPT43_PUB, NPT44_PUB, NPT45_PUB, 
         NPT41_PRIV, NPT42_PRIV, NPT43_PRIV, NPT44_PRIV, NPT45_PRIV
         ) |>
  filter(STABBR == "MA")

education_cohort_combined_data

# output the combined dataset
write_rds(education_cohort_combined_data, file = here::here("dataset", "education_cohort_combined_data.rds")) 




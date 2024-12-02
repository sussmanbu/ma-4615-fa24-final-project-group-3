# This file is purely as an example.
# Note, you may end up creating more than one cleaned data set and saving that
# to separate files in order to work on different aspects of your project

library(tidyverse)

#loan_data <- read_csv(here::here("dataset", "loan_refusal.csv"))

## CLEAN the data
#loan_data_clean <- loan_data |>
  #pivot_longer(2:5, names_to = "group", values_to = "refusal_rate")

#write_rds(loan_data_clean, file = here::here("dataset", "loan_refusal_clean.rds")) 

#Loading in the data

education_cohort_data <- read_csv(here::here("dataset-ignore", "Most-Recent-Cohorts-Institution.csv"))

#Cleaning the data

education_cohort_data_cleaned = education_cohort_data |>
  select(starts_with("C150_4"), # proportion in each race category, full-time, first-time, who completed degree within 150 percent of normal time
         starts_with("D150_4"), # proportion in each race category who completed degree within 150 percent of normal time
         starts_with("IRPS_"), # share of faculty under race categorizations
         starts_with("UGDS_"), # total share of undergraduate degree seeking students who fall under specific race categorizations
         'C100_4', # Completion rate for first-time, full-time students at four-year institutions (100% of expected time to completion)
         'D100_4', # Adjusted cohort count for completion rate at four-year institutions (denominator of 100% completion rate)
          'INSTNM', # institution name
         'ZIP', # Zipcode
         'CITY', # city
         'STABBR', # State
         starts_with("SAT"), # SAT scores related
         starts_with("ACT"), # ACT scores related
         starts_with("NPT"), # avg net price of institution
         'LO_INC_ENRL_ORIG_YR3_RT', # Percent of low-income (between $30,000 and $75,000 in nominal family income) students who were still enrolled at original institution within 3 years
         'MD_INC_ENRL_ORIG_YR3_RT', # Percent of middle-income (between $30,000 and $75,000 in nominal family income) students who were still enrolled at original institution within 3 years
         'HI_INC_ENRL_ORIG_YR3_RT', # Percent of high-income (between $30,000 and $75,000 in nominal family income) students who were still enrolled at original institution within 3 years
         'LO_INC_COMP_ORIG_YR4_RT', # Percent of low-income (less than $30,000 in nominal family income) students who were still enrolled at original institution within 4 years
         'MD_INC_COMP_ORIG_YR4_RT', # Percent of middle-income (between $30,000 and $75,000 in nominal family income) students who completed within 4 years at original institution
         'HI_INC_COMP_ORIG_YR4_RT', # Percent of high-income (above $75,000 in nominal family income) students who completed within 4 years at original institution
         'PCT_WHITE', # Percent of the population from students' zip codes that is White, via Census data
         'PCT_BLACK', # Percent of the population from students' zip codes that is Black, via Census data
         'PCT_ASIAN', # Percent of the population from students' zip codes that is Asian, via Census data
         'PCT_HISPANIC', # Percent of the population from students' zip codes that is Hispanic, via Census data
         )

write_rds(education_cohort_data_cleaned, file = here::here("dataset", "education_cohort_data_cleaned.rds")) 

  

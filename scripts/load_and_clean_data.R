# This file produces the cleaned version of the Most-Recent-Cohorts-Institution Dataset.

suppressWarnings(suppressMessages(library(tidyverse)))
suppressWarnings(suppressMessages(library(ggplot2)))
suppressWarnings(suppressMessages(library(readr)))
suppressWarnings(suppressMessages(library(dplyr)))

#Loading in the data
suppressWarnings(suppressMessages({
  education_cohort_data <- read_csv(here::here("dataset-ignore", "Most-Recent-Cohorts-Institution.csv"))
}))

table_cols <- c(
  # Institution and demographics on student population
  "INSTNM", "STABBR", "HBCU", "PBI", "ANNHI", "TRIBAL", "AANAPII", "HSI", "NANTI","MENONLY", "WOMENONLY",
  
  # Admissions
  "ADM_RATE", "SAT_AVG",
  
  # Cost
  "COSTT4_A","NPT41_PUB", "NPT42_PUB", "NPT43_PUB", "NPT44_PUB", "NPT45_PUB", "NPT41_PRIV", "NPT42_PRIV", "NPT43_PRIV", "NPT44_PRIV", "NPT45_PRIV",
  
  # Students and staff
  "UGDS_WHITE", "UGDS_BLACK", "UGDS_HISP", "UGDS_ASIAN", "UGDS_AIAN", "UGDS_NHPI", "UGDS_2MOR",
  
  # Financial Aid
  "PCTFLOAN", "DEBT_MDN","PLUS_DEBT_INST_MD", ""
  
  
)

education_cohort_data <- education_cohort_data |>
  rename(
    Institution = INSTNM,
    State = STABBR,
    Historically_Black = HBCU,
    Predominantly_Black = PBI,
    Alaska_Native_Native_Hawaiin_Serving = ANNHI,
    Tribal = TRIBAL,
    Asian_American_Pacific_Islander_Serving = AANAPII,
    Hispanic_Serving = HSI,
    Native_American_Nontribal = NANTI,
    Men_only = MENONLY,
    Women_only = WOMENONLY,
    
    Acceptance_rate = ADM_RATE,
    Average_SAT = SAT_AVG,
    
    Average_Cost_Of_Attendance = COSTT4_A,
    Avg_Net_Price_Pub_0_To_30000_Income = NPT41_PUB,
    Avg_Net_Price_Pub_30000_To_48000_Income = NPT42_PUB,
    Avg_Net_Price_Pub_48001_To_75000_Income = NPT43_PUB,
    Avg_Net_Price_Pub_75001_To_110000_Income = NPT44_PUB,
    Avg_Net_Price_Pub_110001_To_Inf_Income = NPT44_PUB,
    
    Avg_Net_Price_Priv_0_To_30000_Income = NPT41_PRIV,
    Avg_Net_Price_Priv_30000_To_48000_Income = NPT42_PRIV,
    Avg_Net_Price_Priv_48001_To_75000_Income = NPT43_PRIV,
    Avg_Net_Price_Priv_75001_To_110000_Income = NPT44_PRIV,
    Avg_Net_Price_Priv_110001_To_Inf_Income = NPT44_PRIV,
    
    Perc_Undergrad_White = UGDS_WHITE,
    Perc_Undergrad_Black = UGDS_BLACK,
    Perc_Undergrad_Hispanic = UGDS_HISP,
    Perc_Undergrad_Asian = UGDS_ASIAN, 
    Perc_Undergrad_American_Indian_Alaskan_Native = UGDS_AIAN,
    Perc_Native_Hawaiin_Pac_Islander = UGDS_NHPI,
    Perc_Two_Or_More_Races = UGDS_2MOR,
    
    Perc_Receiving_Loan = PCTFLOAN,
    Med_Loan_Debt = DEBT_MDN,
    Inst_Loan_Debt = PLUS_DEBT_INST_MD,
    
    
    
    
    
    
    
    
    
    
  )


#Cleaning the data

# education_cohort_data_cleaned = education_cohort_data |>
#   select(starts_with("C150_4"), # proportion in each race category, full-time, first-time, who completed degree within 150 percent of normal time
#          starts_with("D150_4"), # proportion in each race category who completed degree within 150 percent of normal time
#          starts_with("IRPS_"), # share of faculty under race categorizations
#          starts_with("UGDS_"), # total share of undergraduate degree seeking students who fall under specific race categorizations
#          'C100_4', # Completion rate for first-time, full-time students at four-year institutions (100% of expected time to completion)
#          'D100_4', # Adjusted cohort count for completion rate at four-year institutions (denominator of 100% completion rate)
#           'INSTNM', # institution name
#          'ZIP', # Zipcode
#          'CITY', # city
#          'STABBR', # State
#          starts_with("SAT"), # SAT scores related
#          starts_with("ACT"), # ACT scores related
#          starts_with("NPT"), # avg net price of institution
#          'LO_INC_ENRL_ORIG_YR3_RT', # Percent of low-income (between $30,000 and $75,000 in nominal family income) students who were still enrolled at original institution within 3 years
#          'MD_INC_ENRL_ORIG_YR3_RT', # Percent of middle-income (between $30,000 and $75,000 in nominal family income) students who were still enrolled at original institution within 3 years
#          'HI_INC_ENRL_ORIG_YR3_RT', # Percent of high-income (between $30,000 and $75,000 in nominal family income) students who were still enrolled at original institution within 3 years
#          'LO_INC_COMP_ORIG_YR4_RT', # Percent of low-income (less than $30,000 in nominal family income) students who were still enrolled at original institution within 4 years
#          'MD_INC_COMP_ORIG_YR4_RT', # Percent of middle-income (between $30,000 and $75,000 in nominal family income) students who completed within 4 years at original institution
#          'HI_INC_COMP_ORIG_YR4_RT', # Percent of high-income (above $75,000 in nominal family income) students who completed within 4 years at original institution
#          'PCT_WHITE', # Percent of the population from students' zip codes that is White, via Census data
#          'PCT_BLACK', # Percent of the population from students' zip codes that is Black, via Census data
#          'PCT_ASIAN', # Percent of the population from students' zip codes that is Asian, via Census data
#          'PCT_HISPANIC', # Percent of the population from students' zip codes that is Hispanic, via Census data
#          )

#write_rds(education_cohort_data_cleaned, file = here::here("dataset", "education_cohort_data_cleaned.rds")) 

  

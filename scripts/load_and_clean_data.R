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
  "PCTFLOAN", "DEBT_MDN","PLUS_DEBT_INST_MD", "PCTPELL_DCS",
  
  # Racial demographics
  "C150_4_WHITE", "C150_4_BLACK", "C150_4_HISP", "C150_4_ASIAN", "C150_4_AIAN", "C150_4_NHPI", "C150_4_2MOR",
  
  #Earnings
  "MN_EARN_WNE_P6", "MN_EARN_WNE_P7", "MN_EARN_WNE_P8", "MN_EARN_WNE_P9","MN_EARN_WNE_P10",
  
  # Number of undergraduates
  "UGDS"
)

#Cleaning the data
education_cohort_data <- education_cohort_data[,table_cols] # specifies which cols to keep, keeps all rows of the table

  
# Change data names
education_cohort_data <- education_cohort_data |>
  rename(
    Institution = INSTNM,
    State = STABBR,
    Pop = UGDS,
    Historically_Black = HBCU,
    Predominantly_Black = PBI,
    Alask_Nat_Nat_Hawaiian_Serving = ANNHI,
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
    Avg_Net_Price_Pub_110001_To_Inf_Income = NPT45_PUB,
    
    Avg_Net_Price_Priv_0_To_30000_Income = NPT41_PRIV,
    Avg_Net_Price_Priv_30000_To_48000_Income = NPT42_PRIV,
    Avg_Net_Price_Priv_48001_To_75000_Income = NPT43_PRIV,
    Avg_Net_Price_Priv_75001_To_110000_Income = NPT44_PRIV,
    Avg_Net_Price_Priv_110001_To_Inf_Income = NPT45_PRIV,
    
    Perc_Undergrad_White = UGDS_WHITE,
    Perc_Undergrad_Black = UGDS_BLACK,
    Perc_Undergrad_Hispanic = UGDS_HISP,
    Perc_Undergrad_Asian = UGDS_ASIAN, 
    Perc_Undergrad_Am_Indian_Alask_Native = UGDS_AIAN,
    Perc_Native_Hawaiin_Pac_Islander = UGDS_NHPI,
    Perc_Two_Or_More_Races = UGDS_2MOR,
    
    Perc_Receiving_Loan = PCTFLOAN,
    Med_Loan_Debt = DEBT_MDN,
    Inst_Loan_Debt = PLUS_DEBT_INST_MD,
    Socioeconomic_Div = PCTPELL_DCS,
    
    White_Compl_Rate = C150_4_WHITE,
    Black_Compl_Rate = C150_4_BLACK,
    Hisp_Compl_Rate = C150_4_HISP,
    Asian_Compl_Rate = C150_4_ASIAN,
    Asian_Am_Pac_Islander_Compl_Rate = C150_4_AIAN,
    Native_Am_Pac_Islander_Compl_Rate = C150_4_NHPI,
    Two_Or_More_Races_Compl_Rate = C150_4_2MOR,
    
    Mean_earnings_After_6_Years = MN_EARN_WNE_P6,
    Mean_earnings_After_7_Years = MN_EARN_WNE_P7,
    Mean_earnings_After_8_Years = MN_EARN_WNE_P8,
    Mean_earnings_After_9_Years = MN_EARN_WNE_P9,
    Mean_earnings_After_10_Years = MN_EARN_WNE_P10 
    
  )

cols_check_for_na <- c("Acceptance_rate", "Average_Cost_Of_Attendance", "Perc_Undergrad_White", 
                       "Perc_Undergrad_Black", "Perc_Undergrad_Hispanic", "Perc_Undergrad_Asian", 
                       "Perc_Undergrad_Am_Indian_Alask_Native", "Perc_Native_Hawaiin_Pac_Islander", 
                       "Perc_Native_Hawaiin_Pac_Islander", "Perc_Two_Or_More_Races", "Perc_Receiving_Loan",
                       "Med_Loan_Debt", "White_Compl_Rate", "Black_Compl_Rate", "Hisp_Compl_Rate",
                       "Asian_Compl_Rate", "Asian_Am_Pac_Islander_Compl_Rate", "Native_Am_Pac_Islander_Compl_Rate",
                       "Two_Or_More_Races_Compl_Rate","Mean_earnings_After_6_Years","Mean_earnings_After_7_Years",
                       "Mean_earnings_After_8_Years","Mean_earnings_After_9_Years","Mean_earnings_After_10_Years", "Pop")

Mean_earnings = c("Mean_earnings_After_6_Years","Mean_earnings_After_7_Years", "Mean_earnings_After_8_Years","Mean_earnings_After_9_Years","Mean_earnings_After_10_Years")


education_cohort_data <- education_cohort_data |>
  filter_at(vars(one_of(cols_check_for_na)), all_vars(!is.na(.))) |>
  filter(if_all(all_of(Mean_earnings), ~ . != "PS"))
  
# Replace "PS" with NA and convert columns to numeric
education_cohort_data <- education_cohort_data |>
  mutate(across(starts_with("Mean_earnings_After_"), ~ as.numeric(na_if(., "PS"))))

# Calculate the row-wise average
education_cohort_data <- education_cohort_data |>
  rowwise() |>
  mutate(Avg_Mean_earning = mean(c_across(starts_with("Mean_earnings_After_")), na.rm = TRUE)) |>
  ungroup()

# Converting Med_loan_debt from char to num
education_cohort_data <- education_cohort_data |>
  mutate(Med_Loan_Debt = as.numeric(gsub(",", "", Med_Loan_Debt)))

write_rds(education_cohort_data, file = here::here("dataset", "education_cohort_data_cleaned.rds")) 
write_csv(education_cohort_data, file = here::here("dataset", "education_cohort_data_cleaned.csv")) 

write_rds(education_cohort_data, file = here::here("scripts", "education_cohort_data_cleaned.rds")) 
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

  

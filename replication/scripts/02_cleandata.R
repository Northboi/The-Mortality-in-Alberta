library("janitor")
library("knitr")
library("lubridate")
library("tidyverse")

# Clean and transform the data
alberta_cod_clean <- alberta_cod %>%
  # Ensure total_deaths is numeric and replace non-numeric values with NA
  mutate(total_deaths = as.numeric(total_deaths)) %>%
  # Remove rows with NA
  filter(!is.na(total_deaths)) %>%
  # Remove rows where cause is '( Blank )'
  filter(cause != '( Blank )')


# Write the cleaned data to a CSV file
write_csv(
  x = alberta_cod_clean,
  file = "inputs/data/alberta_cod_clean.csv"
)


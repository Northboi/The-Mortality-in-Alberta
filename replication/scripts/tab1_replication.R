#### Preamble ####
# Purpose: Table 1 replication
# Author: Shiji Zhang, Zongcheng Cao
# Date: 15 March 2024
# Contact: kane.zhang@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
if(!require(tidyverse)){install.packages('tidyverse', dependencies = TRUE)}
if(!require(boot)){install.packages('boot', dependencies = TRUE)}
if(!require(broom.mixed)){install.packages('broom.mixed', dependencies = TRUE)}
if(!require(collapse)){install.packages('collapse', dependencies = TRUE)}
if(!require(dataverse)){install.packages('dataverse', dependencies = TRUE)}
if(!require(gutenbergr)){install.packages('gutenbergr', dependencies = TRUE)}
if(!require(janitor)){install.packages('janitor', dependencies = TRUE)}
if(!require(knitr)){install.packages('knitr', dependencies = TRUE)}
if(!require(marginaleffects)){install.packages('marginaleffects', dependencies = TRUE)}
if(!require(modelsummary)){install.packages('modelsummary', dependencies = TRUE)}
if(!require(rstanarm)){install.packages('rstanarm', dependencies = TRUE)}
if(!require(ggplot2)){install.packages('ggplot2', dependencies = TRUE)}
if(!require(lubridate)){install.packages('lubridate', dependencies = TRUE)}
if(!require(kableExtra)){install.packages('kableExtra', dependencies = TRUE)}
if(!require(gridExtra)){install.packages('gridExtra', dependencies = TRUE)}

library(tidyverse)
library(boot)
library(broom.mixed)
library(collapse)
library(dataverse)
library(gutenbergr)
library(janitor)
library(knitr)
library(marginaleffects)
library(modelsummary)
library(rstanarm)
library(ggplot2)
library(lubridate)
library(kableExtra)
library(gridExtra)

alberta_cod_clean <- read.csv("inputs/data/alberta_cod_clean.csv")

library(knitr)
library(kableExtra)

# Define your table data
table_data <- data.frame(
  Column = c("calendar year", "causes", "ranking", "total deaths", "n"),
  Type = c("num", "str", "num", "num", "num"),
  Description = c(
    "Indicating the specific year of each cause of death was recorded in the ranking.",
    "Providing the name of each reason for death. If a leading cause entered the ranking for more than one year, then there will be multiple records with the same 'Cause' variable.",
    "Demonstrating the place of the cause of death in the ranking for a specific year.",
    "Counting the number of times a specific cause of death entered the ranking, which is equivalent to the number of times a specific cause of death appears in the dataset until the latest update.",
    "Counting the number of times a specific cause of death entered the ranking, which is equivalent to the number of times a specific cause of death appears in the dataset until the latest update."
  )
)

# Convert the data frame to a markdown table
kable(table_data, caption = "Variable Description for raw data", booktabs = TRUE) %>%
  kable_styling(full_width = FALSE, position = "center") %>%
  column_spec(1, width = "3em") %>% 
  column_spec(2, width = "3em") %>% 
  column_spec(3, width = "33em")

file_path <- "replication/tables/Table1.csv"
write.csv(table_data, file_path, row.names = FALSE)


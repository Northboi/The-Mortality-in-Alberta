#### Preamble ####
# Purpose: Table 6 replication
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

causes <- c("Chronic", "Neoplasms", "Cardiovascular", "Stroke", "Myocardial Infarction")
expected_deaths_poisson <- rep(exp(7.037), length(causes)) # All α equal to 0
expected_deaths_negbin <- rep(exp(7.036), length(causes)) # All β equal to 0

# Adjust the expected deaths for each cause for the Poisson model
expected_deaths_poisson[1] <- exp(7.037 + 0.446) # Chronic
expected_deaths_poisson[2] <- exp(7.037 + 0.223) # Neoplasms
expected_deaths_poisson[3] <- exp(7.037 - 0.436) # Cardiovascular
expected_deaths_poisson[4] <- exp(7.037 - 0.531) # Stroke

# Adjust the expected deaths for each cause for the Negative Binomial model
expected_deaths_negbin[1] <- exp(7.036 + 0.448) # Chronic
expected_deaths_negbin[2] <- exp(7.036 + 0.223) # Neoplasms
expected_deaths_negbin[3] <- exp(7.036 - 0.435) # Cardiovascular
expected_deaths_negbin[4] <- exp(7.036 - 0.531) # Stroke

# Combine into a data frame
results_df <- data.frame(
  Cause = causes,
  Poisson = expected_deaths_poisson,
  `Negative Binomial` = expected_deaths_negbin
)

write_csv(results_df, "replication/tables/Table6.csv")


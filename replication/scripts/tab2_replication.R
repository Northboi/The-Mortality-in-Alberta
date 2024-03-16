#### Preamble ####
# Purpose: Table 2 replication
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


alberta_cod_clean %>%
  filter(
    calendar_year == 2003,
    ranking <= 15
  ) %>%
  mutate(total_deaths = format(total_deaths, big.mark = ",")) %>%
  write_csv("replication/tables/Table2.csv")



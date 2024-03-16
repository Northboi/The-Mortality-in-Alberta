#### Preamble ####
# Purpose: Figure 1 replication
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

alberta_cod_top_five <-
  alberta_cod_clean |>
  filter(
    calendar_year == 2003,
    n == 22
  ) |>
  slice_max(order_by = desc(ranking), n = 5) |>
  pull(cause)

alberta_cod_clean <-
  alberta_cod_clean |>
  filter(cause %in% alberta_cod_top_five)

cause_of_death_alberta_poisson <-
  stan_glm(
    total_deaths ~ cause,
    data = alberta_cod_clean,
    family = poisson(link = "log"),
    seed = 1000
  )

cause_of_death_alberta_neg_binomial <-
  stan_glm(
    total_deaths ~ cause,
    data = alberta_cod_clean,
    family = neg_binomial_2(link = "log"),
    seed = 1000
  )

coef_short_names <- 
  c("(Intercept)"
    = "(Intercept)",
    "causeAll other forms of chronic ..."
    = "causeAll other forms of...",
    "causeMalignant neoplasms of trac..."
    = "causeMalignant neoplas...",
    "causeAtherosclerotic cardiovascu..."
    = "causeAtherosclero...",
    "causeStroke, not specified as he..."
    = "causeStroke..."
  )

models_list <- list(
  "Poisson" = cause_of_death_alberta_poisson,
  "Negative binomial" = cause_of_death_alberta_neg_binomial
)

model_summary <- modelsummary(models_list, coef_map = coef_short_names, output = "data.frame")

p1 <- pp_check(cause_of_death_alberta_poisson) +
  theme(legend.position = "bottom")

p2 <- pp_check(cause_of_death_alberta_neg_binomial) +
  theme(legend.position = "bottom")

# Combine the plots into one figure, arranged horizontally
combined_plot <- grid.arrange(p1, p2, ncol = 2)

ggsave("replication/plots/figure1.png", combined_plot, width = 10, height = 5)


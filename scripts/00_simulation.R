
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


alberta_death_simulation <-
  tibble(
    cause = rep(x = c("Heart", "Stroke", "Diabetes"), times = 10),
    year = rep(x = 2016:2018, times = 10),
    deaths = rnbinom(n = 30, size = 20, prob = 0.1)
  )

alberta_death_simulation


#### Preamble ####
# Purpose: Figure 2 replication
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

alberta_cod_combined_plot <- alberta_cod_clean %>%
  ggplot(aes(x = calendar_year, y = total_deaths, group = cause, color = cause)) +
  geom_line() +
  theme_minimal() +
  scale_color_brewer(palette = "Set1") +
  labs(x = "Year", y = "Annual number of deaths in Alberta", color = "Cause") +
  guides(color = guide_legend(override.aes = list(size = 4))) + # This sets the size of the legend text
  theme(legend.position = "right", # This moves the legend to the right
        legend.text = element_text(size = rel(0.8)), # Adjust the size as needed
        legend.title = element_text(size = rel(1)), # Adjust the title size as needed
        legend.key.width = unit(1.5, "lines")) # Adjusts the width of the legend keys

ggsave(
  "replication/plots/figure2.png",
  height = 8,
  width = 16,
  units = "in",
  dpi = 300
)


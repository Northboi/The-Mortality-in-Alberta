# Mortality in Alberta: Is the leading cause of death in the 2000s still terrifying?

## Overview of Paper

Medical technology continues to advance. The leading causes of death in the 2000s appear to pose a decreasing threat to individuals. In this report, we selected 2003 as representative of the 2000s and chose the top five causes of death for that year. Using negative binomial and Poisson models, we studied the impact of these causes on mortality over the past 20 years and used regression models to predict future trends. The research findings suggest that the progress in medical technology has not stopped malignant neoplasms and chronic diseases from harming humans. Governments should urge people to pay attention to health issues and raise awareness of disease prevention.

inputs
- data - contains all the data files to be used for analysis and in the tables and figures
  - alberta_cod.csv - dataset includes the variables of "calender_year", "cause", "ranking", "total_deaths", "n"
  - alberta_cod.parquet
  - alberta_cod_clean.csv - A cleaned version of alberta_cod.csv that clean the rows contain NA and (Blank) value
  - alberta_cod_clean.parquet
- llm
  - usage.txt - The conversation history with ChatGPT
- sketches
  - dataset_sketch.png
  - figure1_sketch.png
  - figure2_sketch.png
  - table1_sketch.png
  - table2_sketch.png
  - table3_sketch.png
  - table4_sketch.png
  - table5_sketch.png
  - table6_sketch.png

outputs
  - alberta_mortality.pdf
  - alberta_mortality.qmd 
  - references.bib - reference list for paper.pdf
  
replication

- plots - stores the replicated figures
  -figure1.png
  -figure2.png
- scripts - stores the code of simulating data, downloading the original dataset, cleaning process, testing process and the code to replicate each of the figure and table.
  - 00_simulation.R
  - 01_downloaddata.R
  - 02_cleandata.R
  - 03_tests.R
  - fig1_replication.R
  - fig2_replication.R
  - tab1_replication.R
  - tab2_replication.R
  - tab3_replication.R
  - tab4_replication.R
  - tab5_replication.R
  - tab6_replication.R
- tables - stores the replicated tables
  - Table1.csv
  - Table2.csv
  - Table3.csv
  - Table4.csv
  - Table5.csv
  - Table6.csv


## LLMs statement

Most of the code in the paper and in R markdown is written by ChatGPT. And all conversations I had with ChatGPT can be viewed from inputs/llm/usage.txt

## Reproducibility

Download all files and open the R project alberta-mortality.Rproj in R Studio.

To reproduce the paper, render to pdf alberta_mortality.qmd found at outputs/alberta_mortality.qmd.

To replicate a figure, run the corresponding R file stored in replication/scripts/fig{number}_replication.R. The output will be saved as an image in replication/plots/figure{number}.png .

To replicate a table, run the corresponding R file stored in replication/scripts/tab{number}_replication.R. The output will be saved as an image in replication/plots/tab{number}.csv .

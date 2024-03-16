
# Tests for the variables in the dataset "alberta_cod_clean"

## Test for calendar_year column in the dataset. Testing if the data colletion of this dataset starts from 2001 and end in 2022, and test if every value in this column is integer

all(alberta_cod_clean$calendar_year >= 2001 & alberta_cod_clean$calendar_year <= 2022, na.rm = TRUE)
all(alberta_cod_clean$calendar_year == floor(alberta_cod_clean$calendar_year), na.rm = TRUE)

# Test if the data in 'cause' column is all character.
all(sapply(alberta_cod_clean$cause, is.character))

## Test if the data in 'ranking' column is between 1 and 30 inclusively and are all integer.

all(alberta_cod_clean$ranking >= 1 & alberta_cod_clean$ranking <= 30, na.rm = TRUE)
all(alberta_cod_clean$ranking == floor(alberta_cod_clean$ranking), na.rm = TRUE)

## Test if the data in 'total_deaths' column is all positive integer.

all(alberta_cod_clean$total_deaths > 0, na.rm = TRUE)
all(alberta_cod_clean$total_deaths == floor(alberta_cod_clean$total_deaths), na.rm = TRUE)

## Test if the data in 'n' column is all between 1 and 22 inclusively and are all integers

all(alberta_cod_clean$n >= 1 & alberta_cod_clean$n <= 22, na.rm = TRUE)
all(alberta_cod_clean$n == floor(alberta_cod_clean$n), na.rm = TRUE)


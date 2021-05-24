library(data.table)
library(tidyverse)
library(dplyr)

#pivotando o banco de dados data_country de long para wide

data_country<- data_country %>% select(country, has_flu, person)
data_country <- data_country %>% pivot_wider(names_from = person, values_from = has_flu)

install.packages('funModeling')
library(funModeling)
library(tidyverse)

#EDA utilizano banco de dados original do R sobre pessoas com gripe por país

#observa os dados
glimpse(data_country)

#estrutura dos dados
status(data_country)

#frequencia das variáveis fator
freq(data_country)

#exploração das variáveis numéricas
plot_num(data_country)

#estatísticas das variáveis numéricas
profiling_num(data_country)

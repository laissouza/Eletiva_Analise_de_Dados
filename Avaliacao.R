#### AVALIAÇÃO

#1. Extraia a base geral de covid em Pernambuco disponível neste endereço: https://dados.seplag.pe.gov.br/apps/corona_dados.html.

covidPE <- read.csv2('bases_originais/basegeral.csv', encoding='UTF-8', sep = ';',  header=T, na.strings=c(""," ","NA"))

str(covidPE)

#2. Calcule, para cada município do Estado, o total de casos confirmados e o total de óbitos por semana epidemiológica [atenção, você terá de criar uma variável de semana epidemiológica com base na data].

library(dplyr)
library(lubridate)

covidPE <- covidPE %>% mutate(semana_epi = epiweek(covidPE$dt_notificacao))

confirmados <- ifelse(grepl("CONFIRMADO", covidPE$classe), "sim", "não")

covidPE <- cbind(covidPE, confirmados)

obitos <- ifelse(grepl("OBITO", covidPE$evolucao), "sim", "não")

covidPE <- cbind(covidPE, obitos)

base_confirmados <- covidPE %>% group_by(municipio, semana_epi) %>% count(confirmados)

base_obitos <- covidPE %>% group_by(municipio, semana_epi) %>% count(obitos)

str(base_confirmados)

#3. Enriqueça a base criada no passo 2 com a população de cada município, usando a tabela6579 do sidra ibge.

library(readxl)
library(fuzzyjoin)

hab_mun <- read_xlsx('bases_originais/tabela6579.xlsx')
str(hab_mun)

Casos_covid_mun <- left_join(base_confirmados, hab_mun, by = c('municipio' = 'Municipio'))

Obitos_covid_mun <- left_join(base_obitos, hab_mun, by = c('municipio' = 'Municipio'))

#4. Calcule a incidência (casos por 100.000 habitantes) e letalidade (óbitos por 100.000 habitantes) por município a cada semana epidemiológica.

Casos_covid_mun <- Casos_covid_mun %>% 
  mutate(incidencia = (n / Populacao) * 100.000)
Obitos_covid_mun <- Obitos_covid_mun %>%
  mutate(letalidade = (n / Populacao) * 100.000)
                          
# Extraindo base de dados geral de casos de covid em Pernambuco

base_geral <- read.csv2('bases_originais/basegeral.csv', encoding='UTF-8', sep = ';',  header=T, na.strings=c(""," ","NA"))

str(base_geral)

#Imputação aleatória de valores em NA na coluna sintoma

library(Hmisc)
base_geral$sintomas <- impute(base_geral$sintomas, "random")

table(is.imputed(base_geral$sintomas))

# Calculo o total de casos confirmados e negativos para cada município do Estado

library(dplyr)

CONFIRMADOS <- base_geral %>% filter(classe == "CONFIRMADO") %>% group_by(municipio) %>% count(classe)

NEGATIVOS <- base_geral %>%  filter(classe == "NEGATIVO") %>% group_by(municipio) %>% count(classe)

# variável binária (tag_tosse) se o sintoma inclui tosse ou não e calculo de quantos casos confirmados e negativos tiveram tosse como sintoma

TOSSE <- c("TOSSE")

base_geral <- base_geral %>% mutate(tag_tosse = ifelse(grepl(paste(TOSSE, collapse="|"), sintomas), 'sim', 'nao'))

# Dados agrupados para o Estado, estimando a média móvel de 7 dias de confirmados e negativos

library(zoo)

# média móvel de 7 dias para confirmados

base_geral <- base_geral %>% mutate(confirmadosMM7 = round(rollmean(x = (classe == "CONFIRMADO"), 7, align = "right", fill = NA), 2)) 

# valor defasado em 7 dias para confirmados

base_geral <- base_geral %>% mutate(confirmadosL7 = dplyr::lag(confirmadosMM7, 7)) 

#média móvel de 7 dias para negativos

base_geral <- base_geral %>% mutate(negativosMM7 = round(rollmean(x = (classe == "NEGATIVO"), 7, align = "right", fill = NA), 2))

# valor defasado em 7 dias para confirmados

base_geral <- base_geral %>% mutate(negativosL7 = dplyr::lag(negativosMM7, 7)) 


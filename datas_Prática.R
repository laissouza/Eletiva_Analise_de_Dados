url = 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv' 
covidBR = read.csv2(url, encoding='latin1', sep = ',') 

covidRJ <- subset(covidBR, state == 'RJ') # filtrar para  RJ
str(covidRJ)
covidRJ$date <- as.Date(covidRJ$date, format = "%Y-%m-%d") # modificar a coluna data de string para date

covidRJ$dia <- seq(1:length(covidRJ$date)) # criar um sequencial de dias de acordo com o total de datas para a predição

predDia = data.frame(dia = covidRJ$dia) # criar vetor auxiliar de predição
predSeq = data.frame(dia = seq(max(covidRJ$dia)+1, max(covidRJ$dia)+180)) # criar segundo vetor auxiliar 

predDia <- rbind(predDia, predSeq) # juntar os dois 

install.packages('drc')
library(drc) # pacote para predição

fitLL <- drm(deaths ~ dia, fct = LL2.5(),
             data = covidRJ, robust = 'mean') # fazendo a predição log-log com a função drm

plot(fitLL, log="", main = "Log logistic") # observando o ajuste

predLL <- data.frame(predicao = ceiling(predict(fitLL, predDia))) # usando o modelo para prever para frente, com base no vetor predDia
predLL$data <- seq.Date(as.Date('2020-03-12'), by = 'day', length.out = length(predDia$dia)) # criando uma sequência de datas para corresponder aos dias extras na base de predição

predLL <- merge(predLL, covidRJ, by.x ='data', by.y = 'date', all.x = T) # juntando as informações observadas da base original 

library(plotly) # biblioteca para visualização interativa de dados

plot_ly(predLL) %>% add_trace(x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Mortes - Predição") %>% add_trace(x = ~data, y = ~deaths, name = "Mortes - Observadas", mode = 'lines') %>% layout(
  title = 'Predição de Casos de COVID 19 no Rio de Janeiro', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Mortes Acumuladas por Dia', showgrid = FALSE),
  hovermode = "compare") # plotando tudo junto, para comparação

library(zoo) # biblioteca para manipulação de datas e séries temporais

covidRJ <- covidRJ %>% mutate(newDeaths7 = round(rollmean(x = newCases, 7, align = "right", fill = NA), 2)) # média móvel de 7 dias

covidRJ <- covidRJ %>% mutate(newDeathsL7 = dplyr::lag(newDeaths, 7)) # valor defasado em 7 dias

plot_ly(covidRJ) %>% add_trace(x = ~date, y = ~newDeaths, type = 'scatter', mode = 'lines', name = "Novas Mortes") %>% add_trace(x = ~date, y = ~newDeaths7, name = "Novas Mortes MM7", mode = 'lines') %>% layout(
  title = 'Novas Mortes por COVID19 no Rio de Janeiro', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Novas Mortes por Dia', showgrid = FALSE),
  hovermode = "compare") # plotando tudo junto, para comparação

install.packages('xts')
library(xts)

(covidRJTS <- xts(covidRJ$newDeaths, covidRJ$date)) # transformar em ST
str(covidRJTS)

autoplot(covidRJTS)
acf(covidRJTS)

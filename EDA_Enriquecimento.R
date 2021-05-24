library(tidyverse)
library(readxl)
library(haven)
library(ggthemes)

# banco de dados com número de mortes e casos de covid em 2020

url1 <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/09-03-2020.csv"

download.file(url1, "csse_covid_19_data.csv", mode = "wb")
banco0 <- read.csv("csse_covid_19_data.csv")

banco0 <- banco0 %>%
  select(Country_Region, Confirmed, Deaths, Incidence_Rate)%>%
  filter(Country_Region != "Diamond Princess",
         Country_Region != "MS Zaandam",
         Country_Region != "Kosovo",
         Country_Region != "West Bank and Gaza")%>%
  mutate(Country_Region = recode(Country_Region,
                                 "Burma" = "Burma/Myanmar",
                                 "Czechia" = "Czech Republic",
                                 "Congo (Brazzaville)" = "Republic of the Congo",
                                 "Congo (Kinshasa)" = "Democratic Republic of the Congo",
                                 "US" = "United States of America",
                                 "Korea, South" = "South Korea",
                                 "Cote d'Ivoire" = "Ivory Coast",
                                 "Gambia" = "The Gambia",
                                 "Taiwan*" = "Taiwan")) %>%
  group_by(Country_Region) %>%
  summarise(Confirmed = sum(Confirmed),
            Deaths = sum(Deaths)) %>%
  mutate(Fatality.Ratio = Deaths/Confirmed)

#Banco com número de habitantes de cada país

#Incidence-Rate = n_casos/(população/100.000)

library(xml2)
library(rvest)

site <- "https://www.worldometers.info/world-population/population-by-country" %>%
  read_html() %>%
  html_table(fill = TRUE) %>%
  as.data.frame() %>%
  mutate(Population..2020. = str_replace_all(Population..2020., ",", "")) %>%
  mutate(Population..2020. = as.numeric(Population..2020.)) %>%
  select(Population..2020., Country..or.dependency.) %>%
  arrange(Country..or.dependency.) %>%
  mutate(Country..or.dependency. = recode(Country..or.dependency.,
                                          "Myanmar" = "Burma/Myanmar",
                                          "Czech Republic (Czechia)" = "Czech Republic",
                                          "Côte d'Ivoire" = "Ivory Coast",
                                          "Congo" = "Republic of the Congo",
                                          "DR Congo" = "Democratic Republic of the Congo",
                                          "Saint Kitts & Nevis" = "Saint Kitts and Nevis",
                                          "Sao Tome & Principe" = "Sao Tome and Principe",
                                          "St. Vincent & Grenadines" = "Saint Vincent and the Grenadines",
                                          "Gambia" = "The Gambia",
                                          "United States" = "United States of America",
  ))

# juntando os banco com left_join para mostrar a população de cada país e então fazer a proporção de casos por 100 mil habitantes.

banco0 <- left_join(banco0, site,
                    by = c("Country_Region" = "Country..or.dependency."))
banco0 <- banco0 %>%
  mutate(Incidence_Rate = Confirmed/(Population..2020./100000))

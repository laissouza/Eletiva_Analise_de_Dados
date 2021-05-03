
#web Scraping

library(rvest)
library(dplyr)

url <- "https://pt.wikipedia.org/wiki/Oscar_2021"

tabelas <- url %>% read_html %>% html_nodes("table")
links <- url %>% read_html %>% html_nodes("link")

IndicaçõesOscar2021 <- as.data.frame(html_table(tabelas[9]))

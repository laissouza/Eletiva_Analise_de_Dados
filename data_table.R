library(data.table)
library(dplyr)

Facebook <- read.csv('https://raw.githubusercontent.com/hugoavmedeiros/etl_com_r/850c17c2890a0941ed3e4e6ec2e1d0b805879ab5/bases_originais/dataset_Facebook.csv', sep = ";", encoding = 'UTF-8')

FacebookDT <- Facebook %>% setDT()

FacebookDT[ , lm(formula = Page.total.likes ~ Type + Total.Interactions + share + like + comment)]

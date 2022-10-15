## url_ficulle  = "https://comune.ficulle.tr.it/trasparenza/anac_2020.xml"


library(readr)
library(dplyr)

serv_fatt <- read_delim("data-raw/servizi-fatturazione-elettronica.txt")

use_data(serv_fatt, overwrite = TRUE)

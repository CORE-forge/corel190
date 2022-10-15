#
# Albo degli Arbitri della Camera Arbitrale
# Author: Niccolò Salvini <niccolo.salvini27@gmail.com>
# Date: 12-10-2022
#
library(tidyverse)
library(tidyr)
library(jsonlite)
library(stringr)
library(lubridate)



# source: https://dati.anticorruzione.it/data/aca.json
aca <- fromJSON("https://dati.anticorruzione.it/data/aca.json") %>%
  as_tibble() %>%
  mutate(
    cognome = str_to_title(cognome),
    nome = str_to_title(nome),
    across(starts_with("data"), dmy)
  )

usethis::use_data(aca, overwrite = TRUE)

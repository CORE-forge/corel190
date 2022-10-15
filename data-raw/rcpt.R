#
# Elenco Responsabili Prevenzione Corruzione e Trasparenza
# Author: Niccolò Salvini <niccolo.salvini27@gmail.com>
# Date: 12-10-2022
#

library(tidyverse)
library(jsonlite)
library(usethis)
library(readr)
library(janitor)
library(lubridate)

# Source: https://dati.anticorruzione.it/#/rpct
rcpt <- read_csv("data-raw/rcpt-raw.csv", show_col_types = F) %>%
  clean_names() %>%
  mutate(
    nome = str_to_title(nome),
    cognome = str_to_title(cognome),
    data_nomina = dmy(data_nomina)
  )

usethis::use_data(rcpt, overwrite = TRUE)

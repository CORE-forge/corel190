#
# Elenco società in house
# Author: Niccolò Salvini <niccolo.salvini27@gmail.com>
# Date: 12-10-2022
#
library(tidyverse)
library(jsonlite)
library(usethis)
library(vroom)
library(janitor)
library(lubridate)
library(forcats)

# Source: https://dati.anticorruzione.it/#/inhouse
# non abbiamo la dotazione congiunti nell'esportazione + problemi di extra commans nella colonna `Den. Org. in House`
# da risolvere...
# ho trovato endpoint che fetcha json https://dati.anticorruzione.it/rest/inhouse/ricerca?max=10&start=1 ma va arricchieto
# con header e token di sessione
inhouse <- read_csv("data-raw/in-house-raw.csv",
  show_col_types = F,
  col_types = list(col_skip())
)
mutate(
  data_presentazione = str_to_title(nome),
  data_avvio_istruttoria = str_to_title(cognome),
  data_nomina = dmy(data_nomina)
)

usethis::use_data(rcpt, overwrite = TRUE)

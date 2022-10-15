#
# Dati Registro comunicazioni Art.1 comma 32 L.190/2012
# Author: Niccolò Salvini <niccolo.salvini27@gmail.com>
# Date: 12-10-2022
#

# download from https://dati.anticorruzione.it/#/l190 each dataset
# from export json button for each of the year [2015, 2022] and
# save files into /data/l190-dati-json

library(tidyverse)
library(jsonlite)
library(lubridate)
library(fs)
library(stringr)
library(here)
library(purrr)

file_paths <- fs::dir_ls(here("data-raw", "l190-dati-json"))

open_and_parse_l190_data_json <- function(path) {
  year <- str_extract(basename(path), pattern = "\\d{4}")

  df <- fromJSON(path) %>%
    as_tibble() %>%
    mutate(
      dataUltimoTentativoAccessoUrl = ymd_hms(dataUltimoTentativoAccessoUrl),
      esitoUltimoTentativoAccessoUrl = as_factor(esitoUltimoTentativoAccessoUrl),
      annoDiRiferimento = as.numeric(year)
    )
  return(df)
}

registro_comunicazioni <- map_dfr(file_paths, open_and_parse_json)

usethis::use_data(registro_comunicazioni, overwrite = TRUE)

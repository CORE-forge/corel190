% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get-dati-comunicazione-opec.R
\name{generate_empty_dati_tibble}
\alias{generate_empty_dati_tibble}
\title{Generate defaulte dataframe structure whn something
fails during pipeline}
\usage{
generate_empty_dati_tibble(xml_url, annoDiComunicazione)
}
\description{
This function checks if and url exists
}
\examples{
corel190:::generate_empty_dati_tibble(
  xml_url = "http://contrattipubblici.sipalinformatica.it/l190c32/JOSWG705/indiceDataset.xml",
  annoDiComunicazione = 2022
)
}

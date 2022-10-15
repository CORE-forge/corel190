#' Generate defaulte dataframe structure whn something
#' fails during pipeline
#'
#' This function checks if and url exists
#'
#' @examples
#' corel190:::generate_empty_dati_tibble(
#'   xml_url = "http://contrattipubblici.sipalinformatica.it/l190c32/JOSWG705/indiceDataset.xml",
#'   annoDiComunicazione = 2022
#' )
generate_empty_dati_tibble <- function(xml_url, annoDiComunicazione) {
  empty_xml <- dplyr::tibble(
    cig = NA_character_,
    strutturaProponente = NA_character_,
    oggetto = NA_character_,
    sceltaContraente = NA_character_,
    partecipanti = NA_character_,
    aggiudicatari = NA_character_,
    importoAggiudicazione = NA_character_,
    tempiCompletamento = NA_character_,
    importoSommeLiquidate = NA_character_,
    xml_url = {{ xml_url }},
    annoDiComunicazione = as.character({{ annoDiComunicazione }})
  )
  return(empty_xml)
}


#' @title parse_xml_index
#' @description it transforms and cleans index type xml file into tabular i.e. tibble dataframe class
#' @param href href corresponding to the index annoDiComunicazione
#' @param annoDiComunicazione the annoDiComunicazione to which the CA has communicaterd to ANAC the xml
#' @return tibble
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   parse_xml_index("http://contrattipubblici.sipalinformatica.it/l190c32/JOSWG705/indiceDataset.xml")
#' }
#' }
#' @rdname parse_xml_index
#' @export
parse_xml_index <- function(href, annoDiComunicazione) {
  message("\t", href)
  index <- XML::xmlParse(xml2::read_xml(href) %>%
    rvest::html_element("data")) %>%
    XML::xmlToDataFrame(stringsAsFactors = FALSE) %>%
    dplyr::mutate_all(~ type.convert(., as.is = T)) %>%
    dplyr::mutate(url = href) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(
      annoDiComunicazione = annoDiComunicazione,
      dplyr::across(dplyr::everything(), as.character)
    )
  return(index)
}

#' @title parse_xml_dati
#' @description It parses xml dati
#' @param xml_url url that points to xml file
#' @param annoDiComunicazione PARAM_DESCRIPTIO
#' @return xml tibble dataframe
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   parse_xml_dati("http://www.halleyweb.com/ucpentri/zf/index.php/dataset/appalti-2020.xml")
#' }
#' }
#' @rdname parse_xml_dati
#' @export
parse_xml_dati <- function(xml_url, annoDiComunicazione) {
  handle <- curl::new_handle(verbose = TRUE)
  curl::handle_setopt(handle, http_version = 2)

  if (!corel190:::url_exists(xml_url)) {
    default <- corel190:::generate_empty_contrss(xml_url, annoDiComunicazione)
    return(default)
  }

  tryCatch(
    expr = {
      print(xml_url)
      raw <- read_xml(xml_url)
    },
    error = function(e) {
      print(e)
      message(xml_url)
      handle <- curl::new_handle(verbose = TRUE)
      curl::handle_setopt(handle, http_version = 2)
      req <- xml_url_fetch_memory(xml_url, handle = handle)
      raw <- xml2::read_xml(rawToChar(req$content))
      return(raw)
    }
  )

  if (check_index(raw)) {
    cat("--- this is index --- \n")

    links_to_xml_index <- XML::xmlParse(raw %>%
      rvest::tml_element("indice")) %>%
      XML::xmlToDataFrame()

    index <- purrr::map_dfr(links_to_xml_index$linkDataset, possibly2_insistent_parse_xml_index_data, annoDiComunicazione)
    return(index)
  }

  XML::xmlParse(raw %>%
    rvest.ì::html_element("data")) %>%
    XML::xmlToDataFrame(stringsAsFactors = FALSE) %>%
    dplyr::utate_all(~ type.convert(., as.is = T)) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(
      xml_url = xml_url,
      annoDiComunicazione = as.character(annoDiComunicazione)
    ) %>%
    dplyr::mutate(deplyr::across(dplyr::everything(), as.character)) %>%
    return()
}

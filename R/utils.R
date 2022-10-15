#' Check the "index" in xml tree
#'
#' This function checks wether the xml supplied
#' is and "index" or not. Index xmls groups tenders
#' data by year.
check_index <- function(raw) {
  root <- xml2::xml_root(raw)
  children <- xml2::xml_children(root)
  children_names <- xml2::xml_name(children)
  return(any(children_names %in% c("indice", "indici")))
}

#' @title possibly2
#' @description traditional `purrr::possibly()` with dynamic `otherwise` method
#' @param .f A function, formula, or vector (not necessarily atomic).
#' @param otherwise Default function to use when an error occurs., Default: NULL
#' @return OUTPUT_DESCRIPTION
#' @details DETAILS
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   # EXAMPLE1
#' }
#' }
#' @rdname possibly2
#' @export
possibly2 <- function(.f, otherwise = NULL) {
  function(...) {
    tryCatch(
      {
        .f(...)
      },
      error = function(e) otherwise(...)
    )
  }
}

#' Check if url exists
#'
#' This function checks if and url exists
#'
#' @examples
#' corel190:::url_exists()
url_exists <- function(url) {
  res <- tryCatch(
    {
      invisible(httr::http_status(httr::GET(url))) # , config(http_version = 0)
    },
    error = function(e) {
      invisible(FALSE)
    }
  )

  if (!is.logical(res)) {
    if (res$category == "Success") {
      return(TRUE)
    } else {
      return(FALSE)
    }
  } else {
    return(FALSE)
  }
}

#' @title validate_cf
#' @description Check if `cf` ie "codice fiscale" is valid
#' @param cf codice fiscale aplphanumeric string (valid for both PA and citizens) case insensitive
#' @return bool
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   validate_cf("slvncl96b06a564a")
#'   validate_cf("03179300920")
#' }
#' }
#' @rdname validate_cf
#' @export
validate_cf <- function(cf) {
  return(grepl(cf, pattern = "[A-Za-z]{6}[0-9]{2}[A-Za-z]{1}[0-9]{2}[A-Za-z]{1}[0-9A-Za-z]{3}[A-Za-z]{1}|[A-Za-z]{6}[0-9LMNPQRSTUV]{2}[A-Za-z]{1}[0-9LMNPQRSTUV]{2}[A-Za-z]{1}[0-9LMNPQRSTUV]{3}[A-Za-z]{1}|[0-9]{11,11}"))
}

avail_scelte_contr <- c(
  "01-PROCEDURA APERTA",
  "02-PROCEDURA RISTRETTA",
  "03-PROCEDURA NEGOZIATA PREVIA PUBBLICAZIONE",
  "04-PROCEDURA NEGOZIATA SENZA PREVIA PUBBLICAZIONE",
  "05-DIALOGO COMPETITIVO",
  "06-PROCEDURA NEGOZIATA SENZA PREVIA INDIZIONE DI GARA (SETTORI SPECIALI)",
  "07-SISTEMA DINAMICO DI ACQUISIZIONE",
  "08-AFFIDAMENTO IN ECONOMIA - COTTIMO FIDUCIARIO",
  "14-PROCEDURA SELETTIVA EX ART 238 C.7 D.LGS. 163/2006",
  "17-AFFIDAMENTO DIRETTO EX ART. 5 DELLA LEGGE 381/91",
  "21-PROCEDURA RISTRETTA DERIVANTE DA AVVISI CON CUI SI INDICE LA GARA",
  "22-PROCEDURA NEGOZIATA CON PREVIA INDIZIONE DI GARA (SETTORI SPECIALI)",
  "23-AFFIDAMENTO DIRETTO",
  "24-AFFIDAMENTO DIRETTO A SOCIETA' IN HOUSE",
  "25-AFFIDAMENTO DIRETTO A SOCIETA' RAGGRUPPATE/CONSORZIATE O CONTROLLATE NELLE CONCESSIONI E NEI PARTENARIATI",
  "26-AFFIDAMENTO DIRETTO IN ADESIONE AD ACCORDO QUADRO/CONVENZIONE",
  "27-CONFRONTO COMPETITIVO IN ADESIONE AD ACCORDO QUADRO/CONVENZIONE",
  "28-PROCEDURA AI SENSI DEI REGOLAMENTI DEGLI ORGANI COSTITUZIONALI",
  "29-PROCEDURA RISTRETTA SEMPLIFICATA",
  "30-PROCEDURA DERIVANTE DA LEGGE REGIONALE",
  "31-AFFIDAMENTO DIRETTO PER VARIANTE SUPERIORE AL 20% DELL'IMPORTO CONTRATTUALE",
  "32-AFFIDAMENTO RISERVATO",
  "33-PROCEDURA NEGOZIATA PER AFFIDAMENTI SOTTO SOGLIA",
  "34-PROCEDURA ART.16 COMMA 2-BIS DPR 380/2001 PER OPERE URBANIZZAZIONE A SCOMPUTO PRIMARIE SOTTO SOGLIA COMUNITARIA",
  "35-PARTERNARIATO PER L’INNOVAZIONE",
  "36-AFFIDAMENTO DIRETTO PER LAVORI",
  "SERVIZI O FORNITURE SUPPLEMENTARI",
  "37-PROCEDURA COMPETITIVA CON NEGOZIAZIONE",
  "38-PROCEDURA DISCIPLINATA DA REGOLAMENTO INTERNO PER SETTORI SPECIALI",
  "39-AFFIDAMENTO DIRETTO PER MODIFICHE CONTRATTUALI O VARIANTI PER LE QUALI È NECESSARIA UNA NUOVA PROCEDURA DI AFFIDAMENTO"
)


# TODO
# - needs stemming
# - needs to be case insensitive
# - similarity based methods for correcting differences where's possible


#' @title validate_sceltaContraente
#' @description CCheck if `sc` ie "sceltaContraente" is valid.
#' @param sc codice fiscale aplphanumeric string (valid for both PA and citizens) case insensitive
#' @return bool
#' @examples
#' \dontrun{
#' if (interactive()) {
#'   validate_sceltaContraente("29-PROCEDURA RISTRETTA SEMPLIFICATA")
#'   validate_sceltaContraente("29-PROCEDURE RISTRETTA SEMPLIFICATU")
#' }
#' }
#' @rdname validate_cf
#' @export
validate_sceltaContraente <- function(sc) {
  return(any(sc %in% avail_scelte_contr))
}

#' Albo degli Arbitri della Camera Arbitrale
#'
#' Data regarding official arbitrators' register people
#'
#'
#' @format ## `aca`
#' A data frame with 234 rows and 7 columns:
#' \describe{
#'   \item{cognome, nome}{Arbitrator's surname and name}
#'   \item{data_nascita}{Arbitrator's birthday}
#'   \item{descrizione}{Arbitrator's occupation description }
#'   \item{nr_iscrizione_albo}{Arbitrator's register id}
#'   \item{data_iscrizione_albo, data_cessazione_albo}{ Professional registration date and termiantion}
#'   ...
#' }
#' @source <https://dati.anticorruzione.it/#/aca>
"aca"



#' Elenco Responsabili Prevenzione Corruzione e Trasparenza
#'
#' Data regarding people responsible for corruption prevention and transparency
#'
#'
#' @format ## `rcpt`
#' A data frame with 6,339 rows and 6 columns:
#' \describe{
#'   \item{nome, cognome}{name and suname}
#'   \item{data_nomina}{nominee date}
#'   \item{link_atto_nomina}{deed of appointment's link}
#'   \item{denominazione_persona_giurdica}{legal entity name}
#'   \item{codice_fiscale_persona_giurdica}{legal entity id}
#'   ...
#' }
#' @source <https://dati.anticorruzione.it/#/rpct>
"rcpt"



#' Registro comunicazioni Art.1 comma 32 L.190/2012
#'
#' data List of communications received and processed
#' pursuant to art. 1, paragraph 32, of Law 190/2012;
#'
#'
#' @format ## `rcpt`
#' A data frame with 6,339 rows and 6 columns:
#' \describe{
#'   \item{identificativoPEC}{certified e-mail address (PEC ion ita) address }
#'   \item{codiceFiscale}{id/vat for Certified Authority (CA)}
#'   \item{ragioneSociale}{CA extented name}
#'   \item{url}{xml url pointing to tender data for that year for that CA }
#'   \item{dataUltimoTentativoAccessoUrl, esitoUltimoTentativoAccessoUrl}{latest communication date between CA and ANAC and outcome}
#'   \item{annoDiRiferimento}{the year ANAC has received communication }
#'   ...
#' }
#' @source <https://dati.anticorruzione.it/#/l190>
"registro_comunicazioni"



#' servizi-fatturazione-elettronica
#'
#'
#' The dataset contains information on the electronic invoicing services present in IPA
#' structured with the methods prior to March 31, 2021 (TXT with tabulator separator).
#'
#'
#' @format ## `serv_fatt`
#' A data frame with 53,473 rows and 12 columns:
#' \describe{
#'   \item{cod_amm,cod_ou,cod_uni_ou}{administrative, ou, and unique ou id}
#'   \item{des_ou}{ou description)}
#'   \item{regione,provincia, comune }{region,province and municipality}
#'   \item{indirizzo, cap}{address and cap, i.e. postal code }
#'   \item{cf,}{tax id for CA}
#'   \item{dt_verifica_cf, data_avvio_sfe}{verification and starting service date }
#'   ...
#' }
#' @source <https://indicepa.gov.it/ipa-dati/dataset/servizi-fatturazione-elettronica>
"serv_fatt"

##' Papago text translation
##'
##' \preformatted{
##' ## Examples
##' translate(text = "Hello, world", source = "en", target = "ko")
##' translate_data(data = _some_data_frame_, source = "ko", target = "en")
##' translate_unique_data(data = _some_data_frame_, source = "ja", target = "ko")
##' }
##'
##' @param text A string or vector text you want to translate
##' @param source A string specifying a source language like "en", "ko", "ja", ...
##' @param target A string specifying a target language like "en", "ko", "ja", ...
##' @param platform FALSE using naver cloud platform or not
##' @return A translated text
##' @export
translate <- function(text, source = "en", target = "ko", platform = FALSE) {
  client_id <- get_client_id()
  client_secret <- get_client_secret()
  translator <- papago$Translator(
    client_id = client_id,
    client_secret = client_secret,
    source = source,
    target = target,
    platform = platform
  )
  return(translator$translate(texts = text))
}

##' Papago text translation for data
##'
##' \preformatted{
##' ## Examples
##' translate_data(data = _some_data_frame_, source = "ko", target = "en")
##' }
##'
##' @param data A data.frame contains columns you want to translate
##' @param columns Columns you want to translate
##' @param keep_columns A boolean value specifying keeping source data columns or not
##' @param source A string specifying a source language like "en", "ko", "ja", ...
##' @param target A string specifying a target language like "en", "ko", "ja", ...
##' @param platform A boolean value specifying using naver cloud platform or not
##' @return A translated data.frame
##' @export
translate_data <- function(data, columns, keep_columns = TRUE, source = "en", target = "ko", platform = FALSE) {
  client_id <- get_client_id()
  client_secret <- get_client_secret()
  if (missing(columns))
    columns <- names(data)
  translator <- papago$Translator(
    client_id = client_id,
    client_secret = client_secret,
    source = source,
    target = target,
    platform = platform
  )
  return(translator$translate_data(
    data = data, columns = columns, keep_columns = keep_columns
  ))
}

##' Papago unique text translation for data
##'
##' \preformatted{
##' ## Examples
##' translate_data_unique(data = _some_data_frame_, source = "ja", target = "ko")
##' }
##'
##' @param data A data.frame contains columns you want to translate
##' @param columns Columns you want to translate
##' @param source A string specifying a source language like "en", "ko", "ja", ...
##' @param target A string specifying a target language like "en", "ko", "ja", ...
##' @param platform FALSE using naver cloud platform or not
##' @return A data.frame with unique translated columns (contains both input and output columns)
##' @export
translate_data_unique <- function(data, columns, source = "en", target = "ko", platform = FALSE) {
  client_id <- get_client_id()
  client_secret <- get_client_secret()
  if (missing(columns))
    columns <- names(data)
  translator <- papago$Translator(
    client_id = client_id,
    client_secret = client_secret,
    source = source,
    target = target,
    platform = platform
  )
  return(translator$translate_data_unique(data = data, columns = columns))
}

##' Papago language detection
##'
##' The client id and secret used in this function are different from others.
##'
##' @param text A string text
##' @param client_id A string specifying client id
##' @param client_secret A string specifying client secret
##' @param platform A boolean value determines whether to use naver cloud platform or not
##' @return A translated text
##' @export
detect_language <- function(text, client_id, client_secret, platform = FALSE) {
  detector <- papago$detector$Detector(
    client_id = client_id,
    client_secret = client_secret,
    platform = platform
  )
  return(detector$detect_language(text = text))
}

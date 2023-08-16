##' @details
##'
##' To use this package, you will first need to get your client id and client secret
##' from the website \url{https://developers.naver.com/apps/#/register}.
##' Once you have your client id and secret, you can save it as environment
##' variables for the current session
##' using the \code{\link{set_client_id}} and \code{\link{set_client_secret}} functions.
##' Alternatively, you can set it permanently by adding the following line to
##' your .Renviron file:
##'
##' PAPAGO_CLIENT_ID = PASTE YOUR CLIENT_ID
##' PAPAGO_CLIENT_SECRET = PASTE YOUR CLIENT_SECRET
##'
##' Any functions that require your client id and secret try to retrieve it via
##' \code{Sys.getenv("PAPAGO_CLIENT_ID")}
##' \code{Sys.getenv("PAPAGO_CLIENT_SECRET")}
##'
##' @importFrom reticulate import_from_path
##' @importFrom utils head tail
"_PACKAGE"

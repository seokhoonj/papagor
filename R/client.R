##' Set papago client id
##'
##' @description
##' Save papago client id for the current session. To set it permanently, please add
##' the following line to your .Renvrion file:
##'
##' PAPAGO_CLIENT_ID = "YOUR CLIENT ID"
##'
##' @param client_id A string specifying papago client id
##' @return No return value, called to set client id
##' @export
set_client_id <- function(client_id) {
  Sys.setenv(PAPAGO_CLIENT_ID = client_id)
}

##' @rdname set_client_id
##' @export
print_client_id <- function() {
  Sys.getenv("PAPAGO_CLIENT_ID")
}

get_client_id <- function() {
  client_id <- Sys.getenv("PAPAGO_CLIENT_ID")
  if (client_id == "") {
    stop("Please run this code to provide your client id: set_client_id('your_client_id').",
         call. = FALSE)
  }
  return(client_id)
}

##' Set papago client secret
##'
##' @description
##' Save papago client secret for the current session. To set it permanently, please add
##' the following line to your .Renvrion file:
##'
##' PAPAGO_CLIENT_SECRET = "YOUR CLIENT SECRET"
##'
##' @param client_secret A string specifying papago client secret
##' @return No return value, called to set client secret
##' @export
set_client_secret <- function(client_secret) {
  Sys.setenv(PAPAGO_CLIENT_SECRET = client_secret)
}

##' @rdname set_client_secret
##' @export
print_client_secret <- function() {
  Sys.getenv("PAPAGO_CLIENT_SECRET")
}

get_client_secret <- function() {
  client_secret <- Sys.getenv("PAPAGO_CLIENT_SECRET")
  if (client_secret == "") {
    stop("Please run this code to provide your client secret: set_client_secret('your_client_secret').",
         call. = FALSE)
  }
  return(client_secret)
}

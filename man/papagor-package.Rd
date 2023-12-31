% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/papagor-package.R
\docType{package}
\name{papagor-package}
\alias{papagor}
\alias{papagor-package}
\title{papagor: Papago text translator for R users}
\description{
API wrapper for papago text translator \url{https://developers.naver.com/apps/#/register}.
}
\details{
To use this package, you will first need to get your client id and client secret
from the website \url{https://developers.naver.com/apps/#/register}.
Once you have your client id and secret, you can save it as environment
variables for the current session
using the \code{\link{set_client_id}} and \code{\link{set_client_secret}} functions.
Alternatively, you can set it permanently by adding the following line to
your .Renviron file:

PAPAGO_CLIENT_ID = PASTE YOUR CLIENT_ID
PAPAGO_CLIENT_SECRET = PASTE YOUR CLIENT_SECRET

Any functions that require your client id and secret try to retrieve it via
\code{Sys.getenv("PAPAGO_CLIENT_ID")}
\code{Sys.getenv("PAPAGO_CLIENT_SECRET")}
}
\author{
\strong{Maintainer}: Seokhoon Joo \email{seokhoonj@gmail.com}

}

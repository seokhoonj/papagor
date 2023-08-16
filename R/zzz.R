
papago <- NULL
.onLoad <- function(libname, pkgname) {
  papago <<- reticulate::import_from_path(
    module = "papago",
    path = system.file("python", "papago", package = "papagor"),
    delay_load = TRUE
  )
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    "Please register your app and get your client id and secret from website 'https://developers.naver.com/apps/#/register'."
  )
}

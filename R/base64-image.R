#' Return a base64 encoded string of an image (local filesystem or URL)
#'
#' @param path_or_url local path or URL for the image
#' @export
b64_image <- function(path_or_url) {

  path_or_url <- path_or_url[1]
  if (grepl("^http[s]*://", path_or_url)) {

    httr::GET(
      url = path_or_url,
      httr::write_memory()
    ) -> res

    httr::stop_for_status(res)

    bytes <- httr::content(res, as = "raw", encoding = "UTF-8")

  } else {

    path_or_url <- path.expand(path_or_url)
    file_size <- file.info(path_or_url)$size

    stopifnot(
      c(
        "File not found." = file.exists(path_or_url),
        "File is empty." = file.info(path_or_url)$size > 0
      )
    )

    bytes <- readBin(path_or_url, "raw", n = file.info(path_or_url)$size)

  }

  openssl::base64_encode(bytes)

}
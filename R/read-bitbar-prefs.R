read_bitbar_prefs <- function() {

  bbprefs <- path.expand("~/Library/Preferences/com.matryer.BitBar.plist")

  if (!file.exists(bbprefs)) {

    stop(
      paste0(strwrap(paste0(c(
        "BitBar preferences file not found. ",
        "This likely means BitBar is not installed. ",
        "Please install BitBar before using the {bitbar} package."
      ), collapse = "")), collapse="\n"),
      call.=FALSE
    )
  }

  sys::exec_internal(
    cmd = "/usr/bin/plutil",
    args = c("-extract", "pluginsDirectory", "swift", "-o", "-", bbprefs)
  ) -> res

  if (res$status == 0) {

    res <- gsub('"', "", sub('^[^"]+', "", rawToChar(res$stdout)))
    res

  } else {
    stop("Error reading BitBar preferences.", call.=FALSE)
  }

}

#' BitBar plugins directory
#'
#' @export
bitbar_plugins_dir <- function() {
  read_bitbar_prefs()
}
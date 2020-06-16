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

  tf <- tempfile(fileext = ".xml")
  on.exit(unlink(tf))

  sys::exec_internal(
    cmd = "plistutil",
    args = c("--infile", bbprefs, "--outfile", tf)
  ) -> res

  if (res$status == 0) {

    res <- XML::readKeyValueDB(tf)
    res

  } else {
    stop("Error reading BitBar preferences.", call.=FALSE)
  }

}

#' BitBar plugins directory
#'
#' @export
bitbar_plugins_dir <- function() {
  prefs <- read_bitbar_prefs()
  prefs[["pluginsDirectory"]]
}
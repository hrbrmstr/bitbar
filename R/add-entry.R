#' Add an entry to the menu
#'
#' Use `add_separator()` to add a separator line and `add_entry()` to make new
#' menubar entries.
#'
#' @param text to display. See `type`.
#' @param type type of entry.
#'   - `direct` has no dashes prefix and all output goes directly to the menubar. The first use of `direct` will set the menubar title.
#'   - `submenu` uses `level` repeats of `--` to put these items in submenus
#' @param level used with `submenu` option of `type`
#' @param named BitBar entry parameters. See `References`.
#' @references [BitBar Plugin API Reference](https://github.com/matryer/bitbar#writing-plugins)
#' @export
add_entry <- function(text, type = c("direct", "submenu"), level=1, ...) {

  type <- match.arg(type, c("direct", "submenu"))

  type %>%
    switch(
      direct = text,
      submenu = sprintf("%s%s", paste0(rep("--", level), collapse=""), text)
    ) -> entry

  params <-  ""

  p <- list(...)

  if (length(p) > 0) {

    sapply(names(p), function(name) {
      value <- p[[name]]
      if (is.logical(value)) {
        value <- tolower(as.character(value))
      } else if (!is.character(value)) {
        value <- toString(value)
      } else {
        if (name == "bash") { value = sprintf("'%s'", value) }
      }
      sprintf("%s=%s", name, value)
    }) -> params

    params <- paste0(params, collapse=" ")

  }

  if (nchar(params) > 0) params <- sprintf("|%s", params)

  cat(entry, params, "\n", sep = "")

}

#' @rdname add_entry
#' @export
add_separator <- function() {
  cat("---\n")
}
#' Craft macOS Menu Bar Applications with Rscript
#'
#' Mat Ryer's macOS utility <https://getbitbar.com/> enables any
#' script to become a menu bar application. Tools are provided to make it
#' easier to craft these scripts.
#'
#' @section Installing BitBar:
#'
#' If you have [homebrew](https://brew.sh/) installed, you can do:
#'
#' ```shell
#' brew cask install bitbar
#' ```
#'
#' Otherwise [grab the latest release](https://github.com/matryer/bitbar/releases/latest) and install it the hard way.
#'
#' Open the application and choose the directory you want to be your plugins directory. This is where your menubar scripts will go.
#' (I use `~/Library/BitBar/Plugins` but you can pick any directory; just make sure it isn't one with
#' a gazillion files as that impacts BitBar's performance).
#'
#' @md
#' @name bitbar
#' @importFrom usethis use_template
#' @importFrom XML readKeyValueDB
#' @import httr shiny miniUI
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
"_PACKAGE"

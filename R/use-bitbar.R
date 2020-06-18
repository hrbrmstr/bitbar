#' Helper to get started with a new BitBar {bitbar} script
#'
#' @param save_as full path (including scriptname.R) to where you want the file saved
#' @param title,version,author,github_user,description,dependencies,image_url,about_url
#'        BitBar metadata passed on to the generator.
#' @param refesh if non-blank this will cause the filename to include a refresh hint
#'         in the `save_as` filename before the ending `.R` so BitBar will run the script
#'         every `refresh` period. See [Configuring the refresh time](https://github.com/matryer/bitbar#configure-the-refresh-time)
#'         for more information.
#' @export
#' @examples
#' if (interactive()) {
#'   new_bitbar_script(
#'     save_as = file.path(bitbar_plugins_dir(), "my-awesome-bitbar-script.R"),
#'     title = ":blue_heart:",
#'     description = "Example BitBar Script")
#'   )
#' }
new_bitbar_script <- function(save_as,
                       title = "Script Title",
                       version = "1.0",
                       author = Sys.info()[["user"]],
                       github_user = author,
                       description = "BitBar Plugin Using R",
                       dependencies = "R",
                       image_url = "",
                       about_url = "",
                       refresh = "") {

  usethis:::render_template(
    template = "bitbar.R",
    package = "bitbar",
    data = list(
      title = title,
      mb_title = title,
      version = version,
      author = author,
      github_user = github_user,
      description = description,
      dependencies = dependencies,
      image_url = image_url,
      about_url = about_url
    )
  ) -> rendered_template

  save_as <- path.expand(save_as)

  if (refresh[1] != "") {
    file.path(sprintf(
      "%s.%s.%s",
      tools::file_path_sans_ext(save_as),
      refresh,
      tools::file_ext(save_as)
    )) -> save_as
  }

  writeLines(rendered_template, con = save_as)

  Sys.chmod(save_as, "0755")

  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(save_as)
  } else {
    utils::file.edit(save_as)
  }

}

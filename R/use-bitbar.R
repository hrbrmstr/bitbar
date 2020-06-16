#' Helper to get started with a new BitBar {bitbar} script
#'
#' @param save_as full path (including scriptname.R) to where you want the file saved
#' @param title,version,author,github_user,description,dependencies,image_url,about_url
#'        BitBar metadata passed on to the generator.
#' @export
new_bitbar_script <- function(save_as,
                       title = "Script Title",
                       version = "1.0",
                       author = Sys.info()[["user"]],
                       github_user = author,
                       description = "BitBar Plugin Using R",
                       dependencies = "R",
                       image_url = "",
                       about_url = "") {

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

  writeLines(rendered_template, con = path.expand(save_as))

  Sys.chmod(path.expand(save_as), "0755")

  if (rstudioapi::isAvailable() && rstudioapi::hasFun("navigateToFile")) {
    rstudioapi::navigateToFile(path.expand(save_as))
  } else {
    utils::file.edit(path.expand(save_as))
  }

}

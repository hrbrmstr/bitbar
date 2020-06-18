create_new_bitbar_script <- function() {

  miniPage(
    gadgetTitleBar("New BitBar"),
    miniContentPanel(
      shiny::textInput(
        inputId = "save_as", label = "Save as:", width="100%",
        value = file.path(bitbar_plugins_dir(), sprintf("%s-new-plugin.R", ulid::generate())),
      ),
      shiny::textInput(
        inputId = "refresh", label = "Run every (leave blank for no auto-refresh):", value = "", width="100%",
      ),
      shiny::textInput(
        inputId = "title", label = "Title:", value = "Script Title", width="100%",
      ),
      shiny::textInput(
        inputId = "version", label = "Version:", value = "1.0", width="100%",
      ),
      shiny::textInput(
        inputId = "author", label = "Author:", value = Sys.info()[["user"]], width="100%",
      ),
      shiny::textInput(
        inputId = "github_user", label = "GitHub User:", value = Sys.info()[["user"]], width="100%",
      ),
      shiny::textInput(
        inputId = "description", label = "Description:", value = "BitBar Plugin Using R", width="100%",
      ),
      shiny::textInput(
        inputId = "dependencies", label = "Dependencies:", value = "R", width="100%",
      ),
      shiny::textInput(
        inputId = "image_url", label = "Image URL:", value = "", width="100%",
      ),
      shiny::textInput(
        inputId = "about_url", label = "About URL:", value = "", width="100%",
      )
    )
  ) -> ui

  server <- function(input, output, session) {

    observeEvent(input$done, {

      bitbar::new_bitbar_script(
        save_as = input$save_as,
        title = input$title,
        version = input$version,
        author = input$author,
        github_user = input$github_user,
        description = input$description,
        dependencies = input$dependencies,
        image_url = input$image_url,
        about_url = input$about_url,
        refresh = input$refresh
      )

      stopApp(
        list(
          save_as = input$save_as,
          title = input$title,
          version = input$version,
          author = input$author,
          github_user = input$github_user,
          description = input$description,
          dependencies = input$dependencies,
          image_url = input$image_url,
          about_url = input$about_url,
          refresh = input$refresh
        )
      )

    })

  }

  viewer <- dialogViewer("New BitBar", width = 400, height = 600)

  invisible(runGadget(ui, server, viewer = viewer))

}

#' Open BitBar Plugins Directory in the Finder
#'
#' @export
open_bitbar_dir <- function() {
  system(sprintf("open %s", shQuote(bitbar_plugins_dir())))
}
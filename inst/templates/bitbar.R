#!/Library/Frameworks/R.framework/Resources/bin/Rscript --default-packages=base,tools,utils,stats,methods
#
# <bitbar.title>{{{title}}}</bitbar.title>
# <bitbar.version>{{{version}}}</bitbar.version>
# <bitbar.author>{{{author}}}</bitbar.author>
# <bitbar.author.github>{{{github_user}}}</bitbar.author.github>
# <bitbar.desc>{{{description}}}</bitbar.desc>
# <bitbar.dependencies>{{{dependencies}}}</bitbar.dependencies>
# <bitbar.image>{{{image_url}}}</bitbar.image>
# <bitbar.abouturl>{{{about_url}}}</bitbar.abouturl>

suppressPackageStartupMessages({
  library(magrittr, quietly = TRUE, verbose = FALSE, warn.conflicts = FALSE)
  library(clipr, quietly = TRUE, verbose = FALSE, warn.conflicts = FALSE)
  library(sys, quietly = TRUE, verbose = FALSE, warn.conflicts = FALSE)
  library(bitbar, quietly = TRUE, verbose = FALSE, warn.conflicts = FALSE)
  # other library() calls here
})

add_entry("{{{title}}}") # this will be the menubar title

add_separator()

add_entry(":mushroom: color!", color="#ff0000") # color!

add_entry("R-project…", href="https://r-project.org/") # clickable URL

add_separator()

add_entry("Somewhere") # this will be the submenu entry point
add_entry("Beyond the sea", type = "submenu")
add_entry("Sea", type = "submenu") # this will be a submenu of the submenu
add_entry("Under the Sea", type = "submenu", level = 2)

add_separator()

add_entry("What's on your clipboard?")
add_entry(read_clip(), font="Monaco")

# Keep at end of script ---------------------------------------------------

add_separator()

add_entry("Refresh", refresh=TRUE)

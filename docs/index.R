
header <- paste(
  '<!DOCTYPE html>',
  '<html>',
  '',
  '<head>',
  '<meta charset="utf-8" />',
  '<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />',
  '<title>Slides</title>',
  '<script src="index_files/jquery-1.11.3/jquery.min.js"></script>',
  '<meta name="viewport" content="width=device-width, initial-scale=1" />',
  '<link href="index_files/bootstrap-3.3.5/css/darkly.min.css" rel="stylesheet" />',
  '<script src="index_files/bootstrap-3.3.5/js/bootstrap.min.js"></script>',
  '<script src="index_files/bootstrap-3.3.5/shim/html5shiv.min.js"></script>',
  '<script src="index_files/bootstrap-3.3.5/shim/respond.min.js"></script>',
  '<script src="index_files/navigation-1.1/tabsets.js"></script>',
  '</head>',
  '',
  '<body>',
  sep = "\n"
)


splash <- paste(
  '<div class="jumbotron">',
  '<h1 class="title" align="center">Slides</h1>',
  '<p class="lead" align="center">Danielle Navarro</p>',
  '</div>'
)

bootstrap_card <- function(title, slug, caption = "", alt_text = "") {

  image <- paste0("./index_img/", slug, ".png")
  slide_link <- paste0("./", slug)
  video_link <- paste0("https://youtube.djnavarro.net/", slug)

  paste(
    ' ',
    '<div class="col-sm-3 p-5 m-5">',
    '<div class="card">',
    paste0('<a href="', slide_link, '"><img class="card-img-top" width="100%" src="', image, '" alt="', alt_text, '"></a>'),
    '<div class="card-body">',
    paste0('<h5 class="card-title">', title, '</h5>'),
    paste0('<p class="card-text">', caption, '</p>'),
    paste0('<a href="', slide_link, '" class="btn btn-primary">slides</a>'),
    paste0('<a href="', video_link, '" class="btn btn-primary">youtube</a>'),
    '<p>&nbsp;</p>',
    '<p>&nbsp;</p>',
    '</div>',
    '</div>',
    '</div>',
    ' ',
    sep = "\n"
  )
}

cards <- c(

  '<div class="container-fluid">',
  '<div class="card-group">',

  # R markdown
  bootstrap_card(
    title = "Starting R Markdown",
    slug = "starting-rmarkdown"
  ),

  # ggplot2
  bootstrap_card(
    title = "Starting ggplot2",
    slug = "starting-ggplot2"
  ),

  # readr
  bootstrap_card(
    title = "Starting readr",
    slug = "starting-readr"
  ),

  # dplyr
  bootstrap_card(
    title = "Starting dplyr",
    slug = "starting-dplyr"
  ),

  # programming of art
  bootstrap_card(
    title = "Starting programming",
    slug = "starting-programming"
  ),

  # functional programming
  bootstrap_card(
    title = "Starting functions",
    slug = "starting-functions"
  ),


  # installing R
  bootstrap_card(
    title = "Installing R",
    slug = "installing-r"
  ),

  # project structure
  bootstrap_card(
    title = "Project structure",
    slug = "project-structure"
  ),

  "</div>",
  "</div>",
  "<br><br>"
)



footer <- paste(
  '</body>',
  '</html>'
)

doc <- c(header, splash, cards, footer)

brio::write_lines(doc, "~/GitHub/slides/docs/index.html")

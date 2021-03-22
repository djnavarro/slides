
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
  '<h2 class="title" align="center">Slides</h2>',
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
    paste0('<h4 class="card-title">', title, '</h4>'),
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
    title = "Starting R markdown",
    slug = "starting-rmarkdown",
    caption = "An introduction to R markdown. The target audience is a novice R user with no previous experience with markdown. Covers the basics of markdown, and illustrates the structure of an R markdown document, including the YAML header. Briefly describes LaTeX equations."
  ),

  # ggplot2
  bootstrap_card(
    title = "Starting ggplot2",
    slug = "starting-ggplot2",
    caption = "An introduction to ggplot2. The target audience is a novice user with no previous experience with R or ggplot2. Does not cover the entire grammar, but helps the user reach the point at which they can make quality data visualisations."
  ),

  # readr
  bootstrap_card(
    title = "Starting readr",
    slug = "starting-readr",
    caption = "Discusses how to read and write CSV files using the readr package. It is assumed the audience has a little experience with R, but not much. Also introduces the magrittr pipe and the dplyr workflow for group_by() and summarise()"
  ),

  # dplyr
  bootstrap_card(
    title = "Starting dplyr",
    slug = "starting-dplyr",
    caption = "An introduction to data wrangling with dplyr. Covers filter(), select(), mutate() and arrange() primarily, but also discusses joins and the pivot_longer() and pivot_wider() functions from tidyr."
  ),

  # programming of art
  bootstrap_card(
    title = "Starting programming",
    slug = "starting-programming",
    caption = "This is primarily a tutorial on making generative art in R, but in doing so introduces core programming constructs and data structures. It is assumed the user has some previous experience with ggplot2."
  ),

  # functional programming
  bootstrap_card(
    title = "Starting functions",
    slug = "starting-functions",
    caption = "This is also an art tutorial that introduces key programming concepts, and follows naturally from the 'starting programming' slides. It shows how to write functions and exposes the user to some of the purrr functionality."
  ),


  # installing R
  bootstrap_card(
    title = "Installing R",
    slug = "installing-r",
    caption = "A walkthrough showing how to install R and RStudio, with examples for Mac, Windows and Ubuntu. The target audience is a novice with a little R experience (e.g., via RStudio Cloud) who now wants to run R locally."
  ),

  # project structure
  bootstrap_card(
    title = "Project structure",
    slug = "project-structure",
    caption = "Inspired by Jenny Bryan's 'Naming Things' slide deck, these slides discuss how to name files, introduces file paths, and discusses the basics of project organisation and management."
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


header <- paste(
  '<!DOCTYPE html>',
  '<html>',
  ' ',
  '<head>',
  ' ',

  # meta tags
  '<meta charset="utf-8" />',
  '<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />',
  '<meta name="viewport" content="width=device-width, initial-scale=1" />',
  '<meta name="author" content="Danielle Navarro" />',
  '<meta name="description" content="Slide decks by Danielle Navarro"/>',
  '<meta name="github-repo" content="djnavarro/slides"/>',
  '<meta name="twitter:title" content="Slide decks by Danielle Navarro"/>',
  '<meta name="twitter:description" content="Slide decks by Danielle Navarro"/>',
  '<meta name="twitter:url" content="https://slides.djnavarro.net/"/>',
  '<meta name="twitter:image:src" content="https://slides.djnavarro.net/index_img/twitter-image.png"/>',
  '<meta name="twitter:image:alt" content=""/>',
  '<meta name="twitter:card" content="summary_large_image"/>',
  '<meta name="twitter:creator" content="@djnavarro"/>',
  '<meta name="twitter:site" content="@djnavarro"/>',
  '<meta property="og:title" content="Slide decks by Danielle Navarro"/>',
  '<meta property="og:description" content="Slide decks by Danielle Navarro"/>',
  '<meta property="og:url" content="https://slides.djnavarro.net/"/>',
  '<meta property="og:image" content="https://slides.djnavarro.net/index_img/twitter-image.png"/>',
  '<meta property="og:image:alt" content=""/>',
  '<meta property="og:type" content="website"/>',
  '<meta property="og:locale" content="en_US"/>',
  '<meta property="article:author" content="Danielle Navarro"/>',
  ' ',

  # title
  '<title>Slides</title>',
  ' ',

  # add bootstrap 4.6
  '<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">',
  '<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>',
  '<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>',
  ' ',

  # set page background
  '<style>body{background:#292b2c;}</style>',
  ' ',

  '</head>',
  ' ',
  '<body>',
  sep = "\n"
)


splash <- paste(
  ' ',
  '<div class="jumbotron text-white bg-dark">',
  '<h2 class="title" align="center">Slides</h2>',
  '<p class="lead" align="center">Danielle Navarro</p>',
  '</div>',
  ' '
)

bootstrap_card <- function(title, slug, caption = "", alt_text = paste(title, "slides")) {

  image <- paste0("./index_img/", slug, ".png")
  slide_link <- paste0("./", slug)
  video_link <- paste0("https://youtube.djnavarro.net/", slug)

  paste(

    # setup card
    ' ',
    '<div class="col-12 col-md-6 d-flex align-items-stretch">',
    '<div class="card text-white bg-dark mb-3 p-3">',
    ' ',

    # insert image, title, and caption into the card body
    paste0('<a href="', slide_link, '"><img class="card-img-top p-0 m-0" src="', image, '" alt="', alt_text, '"></a>'),
    '<div class="card-body">',
    paste0('<h4 class="card-title">', title, '</h4>'),
    paste0('<p class="card-text">', caption, '</p>'),
    '</div>',
    ' ',

    # insert links into the card footer
    '<div class="card-footer">',
    paste0('<a href="', slide_link, '" class="btn btn-primary">slides</a>'),
    paste0('<a href="', video_link, '" class="btn btn-primary">youtube</a>'),
    '</div>',
    ' ',

    # close card
    '</div>',
    '</div>',
    ' ',
    sep = "\n"
  )
}

cards <- c(

  '<div class="container">',
  '<div class="row">',
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
  "</div>",
  "<br><br>"
)



footer <- paste(
  '</body>',
  '</html>'
)

doc <- c(header, splash, cards, footer)

brio::write_lines(doc, "~/GitHub/slides/docs/index.html") # <- badness here!

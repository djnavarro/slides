
# path defined relative to git root, not rproj root
# (ensures script works no matter which sub-project
# is open)
git_root <- rprojroot::find_root(".git/HEAD")
html_path <- fs::path(git_root, "index.html")

# set up header
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
  '<meta name="twitter:image:src" content="http://slides.djnavarro.net/index_img/twitter-image.png"/>',
  '<meta name="twitter:image:alt" content=""/>',
  '<meta name="twitter:card" content="summary_large_image"/>',
  '<meta name="twitter:creator" content="@djnavarro"/>',
  '<meta name="twitter:site" content="@djnavarro"/>',
  '<meta property="og:title" content="Slide decks by Danielle Navarro"/>',
  '<meta property="og:description" content="Slide decks by Danielle Navarro"/>',
  '<meta property="og:url" content="https://slides.djnavarro.net/"/>',
  '<meta property="og:image" content="http://slides.djnavarro.net/index_img/twitter-image.png"/>',
  '<meta property="og:image:alt" content=""/>',
  '<meta property="og:type" content="website"/>',
  '<meta property="og:locale" content="en_US"/>',
  '<meta property="article:author" content="Danielle Navarro"/>',
  ' ',

  # plausible analytics
  '<script async defer data-domain="slides.djnavarro.net" src="https://plausible.io/js/plausible.js"></script>',
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

# splash banner
splash <- paste(
  ' ',
  '<div class="jumbotron text-white bg-dark" style="background-image: url(\'index_img/banner.png\'); padding-top: 10%; padding-bottom: 10%; background-size: cover">',
  '<h1 class="title" align="center" style="font-size:300%"><b>djnavarro :: slides</b></h1>',
  '<p align="center" style="font-size:120%">slide decks by <a style="color:#ffffff; text-decoration: underline" href="https://djnavarro.net">danielle navarro</a></p>',
  '</div>',
  '<br>',
  ' '
)

# define a bootstrap card
bootstrap_card <- function(title, slug, caption = "",
                           alt_text = paste(title, "slides"),
                           slide_link = paste0("./", slug),
                           video_link = paste0("https://youtube.djnavarro.net/", slug),
                           repo_link = paste0("https://github.com/djnavarro/slides-", slug),
                           site_link = NULL
                           ) {

  image <- paste0("./index_img/", slug, ".png")
  #bilibili_link <- paste0("https://bilibili.djnavarro.net/", slug)

  paste(

    # setup card
    ' ',
    '<div class="col-12 col-md-6 d-flex align-items-stretch">',
    '<div class="card text-white bg-dark mb-3 p-3">',
    paste0('<a name="', slug, '"></a>'),
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
    if(!is.null(slide_link)) paste0('<a href="', slide_link, '" class="btn btn-primary">slides</a>'),
    if(!is.null(video_link)) paste0('<a href="', video_link, '" class="btn btn-primary">recording</a>'),
    if(!is.null(repo_link)) paste0('<a href="', repo_link, '" class="btn btn-primary">repository</a>'),
    if(!is.null(site_link)) paste0('<a href="', site_link, '" class="btn btn-primary">site</a>'),
    '</div>',
    ' ',

    # close card
    '</div>',
    '</div>',
    ' ',
    sep = "\n"
  )
}

# define the card group
cards <- c(

  '<div class="container">',
  '<div class="row">',
  '<div class="card-group">',

  # latin-r
  bootstrap_card(
    title = "A tour of the Apache Arrow ecosystem for the R community",
    slug = "arrow-latinr-2022",
    caption = "Invited talk given for Latin-R 2022",
    video_link = "https://youtu.be/s1ONP_s8ASg?t=227"
  ),


  # art-from-code
  bootstrap_card(
    title = "Making Art from Code",
    slug = "art-from-code",
    caption = "A workshop presented at rstudio::conf(2022)",
    video_link = NULL,
    repo_link = "https://github.com/rstudio-conf-2022/art-from-code",
    site_link = "https://art-from-code.netlify.app"
  ),

  # project structure
  bootstrap_card(
    title = "Larger-than-memory workflows with Apache Arrow",
    slug = "arrow-user-2022",
    caption = "A workshop presented to the useR!2022 conference",
    video_link = NULL,
    repo_link = "https://github.com/djnavarro/arrow-user2022",
    site_link = "https://arrow-user2022.netlify.app"
  ),

  # project structure
  bootstrap_card(
    title = "Introduction to Arrow for R users",
    slug = "data-thread-2022",
    caption = "A talk given as part of The Data Thread 2022, the inaugural conference of the Apache Arrow community"
  ),

  # project structure
  bootstrap_card(
    title = "Project structure",
    slug = "project-structure",
    caption = "Inspired by Jenny Bryan's 'Naming Things' slide deck, these slides discuss how to name files, introduces file paths, and discusses the basics of project organisation and management."
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

  # R markdown
  bootstrap_card(
    title = "Starting R markdown",
    slug = "starting-rmarkdown",
    caption = "An introduction to R markdown. The target audience is a novice R user with no previous experience with markdown. Covers the basics of markdown, and illustrates the structure of an R markdown document, including the YAML header. Briefly describes LaTeX equations."
  ),

  # ggplot2
  bootstrap_card(
    title = "Starting ggplot",
    slug = "starting-ggplot",
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

  # installing R
  bootstrap_card(
    title = "Installing R",
    slug = "installing-r",
    caption = "A walkthrough showing how to install R and RStudio, with examples for Mac, Windows and Ubuntu. The target audience is a novice with a little R experience (e.g., via RStudio Cloud) who now wants to run R locally."
  ),

  "</div>",
  "</div>",
  "</div>",
  "<br><br>"
)

# close document
footer <- paste(
  '</body>',
  '</html>'
)

# write document
doc <- c(header, splash, cards, footer)
brio::write_lines(doc, html_path)

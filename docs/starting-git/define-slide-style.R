# load packages -----------------------------------------------------------

library(xaringanthemer)


# handy functions to tweak hex codes --------------------------------------

col2hex <- function(name) {
  col_matrix <- grDevices::col2rgb(name)
  col_string <- grDevices::rgb(
    red   = col_matrix[1, ]/255,
    green = col_matrix[2, ]/255,
    blue  = col_matrix[3, ]/255
  )
  return(col_string)
}

blend_shades <- function(x, y, p = .5) {
  x <- col2rgb(x)
  y <- col2rgb(y)
  z <- round(p*x + (1-p)*y)
  z <- rgb(red = z[1, ]/255, green = z[2, ]/255, blue = z[3, ]/255)
  return(z)
}


# set colors --------------------------------------------------------------
style_duo_accent(
  primary_color      = "#DEBAD6", # orchid 
  secondary_color    = "#603F8B", # purple
  header_font_google = google_font("Raleway"),
  link_color         = choose_dark_or_light("#1E2E2C", white = "#FCB5AC"), # salmon links
  text_font_google   = google_font("Raleway", "300", "300i"),
  code_font_google   = google_font("Fira Code"),
  text_font_size     = "30px",
  outfile            = here::here("style", "xaringan-themer.css")
)

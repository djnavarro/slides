# load packages ----------------------------------------------------------------

library(xaringanthemer)

# set colors -------------------------------------------------------------------
style_duo_accent(
  primary_color      = "#3D5B59", # teal green 
  secondary_color    = "#1E2E2C", # dark teal green
  header_font_google = google_font("Raleway"),
  link_color = choose_dark_or_light("#1E2E2C", white = "#FCB5AC"), # salmon links
  text_font_google   = google_font("Raleway", "300", "300i"),
  code_font_google   = google_font("Fira Code"),
  text_font_size     = "30px",
  outfile            = here::here("style", "xaringan-themer.css")
)

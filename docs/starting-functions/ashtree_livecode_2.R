
library(tidyverse)


# helper functions --------------------------------------------------------

radians <- function(degree) {
  2 * pi * degree / 360
}

# STAGE 4: we're going to need more "helper functions". I think of helpers
# as very simple functions that take only a couple of lines to write, but
# are useful for tidying the rest of the code!

adjust_scale <- function(s, scales) {
  s * sample(x = scales, size = length(s), replace = TRUE)
}

adjust_angle <- function(a, angles) {
  a + sample(x = angles, size = length(a), replace = TRUE)
}

adjust_x <- function(x, scale, angle) {
  x + scale * cos(radians(angle))
}

adjust_y <- function(y, scale, angle) {
  y + scale * sin(radians(angle))
}




# ashtree functions -------------------------------------------------------

# STAGE 2: add the grow_sapling() function...

grow_sapling <- function() {
  
  sapling <- tibble(
    old_x = 0,  # sapling grows from the origin
    old_y = 0,  # sapling grows from the origin
    new_x = 0,  # sapling doesn't grow horizontally
    new_y = 1,  # sapling does grow vertically
    angle = 90, # angle from horizontal is 90 degrees
    scale = 1,  # length of the sapling is 1
  )
  return(sapling)
}

# STAGE 5: create a function that takes a tibble "tips" as input, in which
# each row corresponds to one of the "tips" (terminal nodes) of the tree 
# and creates a new segment that extends from each such tip.


grow_from <- function(tips) {
  
  # parameter values
  all_scales <- c(.8, .9, .95)
  all_angles <- c(-10, -5, 5, 10, 20, 25)
  
  # mutate the tips tibble
  new_growth <- tips %>%
    mutate(
      scale = adjust_scale(scale, all_scales),      # change segment length
      angle = adjust_angle(angle, all_angles),      # change segment angle
      old_x = new_x,                                # begin where last seg ended
      old_y = new_y,                                # begin where last seg ended
      new_x = adjust_x(old_x, scale, angle),        # end where this seg ends!
      new_y = adjust_y(old_y, scale, angle)         # end where this seg ends!
    )
  return(new_growth)
}





# do stuff ----------------------------------------------------------------


# STAGE 3: structure our code so that all of our "ashtree" functions are
# defined up the top, before we do anything; also add code so that it 
# draws a picture!

set.seed(1)

# STAGE 6: let's call our new functions over and over...

# initialise
tree <- grow_sapling()
tips <- tree

# grow once
tips <- grow_from(tips)
tree <- bind_rows(tree, tips)

# grow again
tips <- grow_from(tips)
tree <- bind_rows(tree, tips)




pic <- ggplot(
  data = tree,
  mapping = aes(
    x = old_x, 
    y = old_y, 
    xend = new_x, 
    yend = new_y
  )
) + 
  geom_segment(show.legend = FALSE) + 
  theme_void() + 
  coord_equal()

plot(pic)

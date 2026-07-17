# 9.4 Learning about faceting with facet_wrap() ----
# Splitting plots into subplots, each displaying one subset of the data
# Note: use categorical variable!

library(tidyverse)
library(ggthemes) # Package contains colors for colorblind people

# We will be using the 'mpg' dataset
mpg
glimpse(mpg)
# ?mpg, to get access to variables used in ds
# str(mpg), to access structure of object

# Example ---- 
ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) + 
  geom_point() +
  facet_wrap(~cyl)

## Facetting plot with combination of two variables, use facet_grid() ----

ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) + 
  geom_point() + 
  facet_grid(drv ~ cyl) # double sided formula: rows ~ cols


ggplot(
  data = mpg, 
  mapping = aes(x = displ, y = hwy)
) + 
  geom_point(mapping = aes(color = class)) + 
  scale_color_colorblind() +
  # by default, each facet shares same scale
  # set scales = "free", to allow different scales for both axis
  # other options: "free_x", "free_y"
  facet_grid(drv ~ cyl, scales = "free")


## 9.4.1 Exercise ----

# Q1: What happens if we facet on continuous variable?
ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) + 
  geom_point() + 
  facet_wrap(~displ) 
# A: Creates facet for every unique value of displ

# Q2: What do empty cells in the plot mean with facet_grid(drv ~ cyl)
ggplot(
  data = mpg,
  mapping = aes(x = drv, y = cyl)
) + 
  geom_point()
# compare to:
ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) + 
  geom_point() + 
  facet_grid(drv ~ cyl)
# A: No corresponding values for some combinations

# Q3: What plots does following code make? What does . do?
ggplot(
  data = mpg,
  mapping = aes(x = displ, y = hwy)
) + 
  geom_point() + 
  facet_grid(drv ~ .)

ggplot(
  data = mpg
) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(. ~ cyl)

# A: 
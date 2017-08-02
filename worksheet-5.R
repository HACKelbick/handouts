## Getting started

library(dplyr)
library(ggplot2)
animals <- read.csv("data/animals.csv", na.strings = "") %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight))

## Constructing layered graphics in ggplot
ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_point()
#aes tells ggplot how you want to map the variables in the datafram - aesthetic mapping
#geom_point = points! 

ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot()
#boxplots

ggplot(data = animals,
       aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean",
             color = "red")
  #add mean, make it red!

ggplot(data = animals,
       aes(x = species_id, y = weight, color = species_id)) +
  geom_boxplot() +
  geom_point(stat = "summary",
             fun.y = "mean",
             by "sex")
#RAINBOWS!

## Exercise 1
animals_dm <- filter (animals, species_id == "DM")
ggplot (data=animals_dm, aes(x=year, y=weight, color=sex))
geom_line(stat = "summary",
           fun.y = "mean")

#



## Adding a regression line

levels(animals$sex) <- c('Female', 'Male')
animals_dm <- filter(animals, species_id == 'DM')
ggplot(data = animals_dm,
       aes(x = year, y = weight)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(method = 'lm')
#geom smooth is for a regression, geom line is just a line connecting the points

ggplot(data = animals_dm,
       aes(x = year,
           y = weight,
           color = sex)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(method = 'lm')

year_wgt <- ggplot(data = animals_dm,
                   aes(x = year,
                       y = weight,
                       color = sex)) + 
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(method = "lm")

year_wgt +
  scale_color_manual(values = c("darkblue", "orange"))

year_wgt

# Storing and re-plotting

year_wgt <- ggplot(data = animals_dm,
                   aes(x = year,
                       y = weight,
                       color = sex)) +
  geom_point(aes(shape = sex),
             size = 3,
             stat = 'summary',
             fun.y = 'mean') +
  geom_smooth(method = 'lm')

year_wgt +
  ...
                     
year_wgt <- year_wgt +
  scale_color_manual(...)
year_wgt

## Exercise 2

...

## Axes, labels and themes

histo <- ggplot(data = animals_dm,
                aes(x = weight, fill = sex)) +
  geom_...
histo

histo <- histo +
  ...(title = 'Dipodomys merriami weight distribution',
       x = 'Weight (g)',
       y = 'Count') +
  scale_x_continuous(limits = c(20, 60),
                     breaks = c(20, 30, 40, 50, 60))
histo

histo <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = ...,
        ... = element_text(...),
        ... = element_text(size = 13, vjust = 0))
histo

## Facets

animals_common <- filter(animals, ...)
ggplot(data = ...,
       ...) +
  geom_histogram() +
  ...
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

ggplot(data = animals_common,
       aes(x = weight)) +
  geom_histogram(...,
                 ...) +
  geom_histogram() +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)")

ggplot(data = animals_common,
       aes(x = weight, ...)) +
  geom_histogram(...) +
  facet_wrap( ~ species_id) +
  labs(title = "Weight of most common species",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)		

## Exercise 3

...


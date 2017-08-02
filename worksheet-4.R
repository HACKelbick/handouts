## Tidy data concept

response <- data.frame(
  trial = 1:3,
  treatment = c(0.22, 0.58, 0.31),
  control = c(0.42, 0.19, 0.40)
)

## Reshaping multiple columns in category/value pairs

library(tidyr)

df <- gather(response, key = "factor", value = "respose", -trial)

counts <- data.frame(
  site = rep(1:3, each = 2),
  species = rep(c("lynx", "hare"), 3),
  n = c(2, 341, 7, 42, 0, 289)
)

#replicate site numbers 1-3, with each site happening twice = rep(1:3, each = 2),
#replicate lynx and hare, so each site gets assigned lynx then hare = rep(c("lynx", "hare"), 3),
#THEN assign numbers along that vector

counts_spread <- spread(counts,
                        key = species,
                        value = n)

## Exercise 1

counts <- data.frame(
  site = rep(1:3, each = 2),
  species = rep(c("lynx", "hare"), 3),
  n = c(2, 341, 7, 42, 0, 289)
)

counts2 <- counts [-5, ] # THIS pulls everything but the fifth row



spread(counts2,key = species, value = n, fill = 0)


## Read comma-separated-value (CSV) files


animals <- read.csv('data/animals.csv')

#reading in blanks as an NA not as a string

animals <- read.csv('data/animals.csv', na.strings = "")

library(dplyr)
library(...)

animals_1990_winter <- animals_1990_winter <- filter (animals, year ==1990, month %in% 1:3)

animals_1990_winter <- select(animals_1990_winter, -year)
str(animals_1990_winter)

sorted <- arrange(animals_1990_winter, desc(species_id), weight)
#desc sorts by descending on that variable, so the species ID will be descending

head(sorted)
View(sorted)

con <- ...(..., host = 'localhost', dbname = 'portal')
animals_db <- ...
animals <- ...
dbDisconnect(...)

## Subsetting and sorting

library(dplyr)
animals_1990_winter <- filter(...,
                              ...,
                              ...)

animals_1990_winter <- select(animals_1990_winter, ...)

sorted <- ...(animals_1990_winter,
              ...)

## Exercise 2

str(animals_ro)

animals_ro2 <- select(animals_ro, id, sex, weight)

animals_1990_winter <- select(animals_1990_winter, -year)

## Chainning with pipes

sorted_pipe <- animals %>%
    ... # filter to the first 3 months of 1990
    ... # select all columns but year
    ... # sort with descening species_id and weight

## Grouping and aggregation

counts_1990_winter <- animals_1990_winter %>%
    group_by(...) %>%
    ...

weight_1990_winter <- animals_1990_winter %>%
    ...
    summarize(avg_weight = mean(...))

## Exercise 3

...

## Transformation of variables

prop_1990_winter <- counts_1990_winter %>%
    mutate(...)

## Exercise 4

...

## Database Connection

library(...)

con <- ...(PostgreSQL(), host = 'localhost', dbname = 'portal')
animals_db <- ...

species_month_prop <- ...
    group_by(species_id, month) %>%
    summarize(count = n()) %>%
    mutate(prop = count / sum(count)) %>%
    select(-count)

pivot <- ...
  spread(month, prop, fill = 0)

dbDisconnect(con)

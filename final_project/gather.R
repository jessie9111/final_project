library(tidyverse)

gen_pop <- read_csv("raw_data/GEN_POP_2020.CSV")

gen_pop %>%
  select(country, age) %>%
  mutate(age = ifelse(gen_pop$age == "Not Available", NA, gen_pop$age)) %>%
  drop_na() %>%
  group_by(country, age) %>%
  summarize(respondents = n())

geography_sum <- gen_pop %>%
  select(geography) %>%
  mutate(geography = ifelse(gen_pop$geography == "Not Available", NA, gen_pop$geography)) %>%
  drop_na() %>%
  group_by(geography) %>%
  summarize(respondents = n()) 

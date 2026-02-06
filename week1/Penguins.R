library(lubridate)
library(tidyverse)
library(janitor)
penguins_clean_names <- readRDS(here( "week1", "data", "penguins.RDS"))
glimpse(penguines_clean_names)

#trim data and clean up names
str_trim(" Adelie Penguin (Pygoscelis adeliae) ")
str_trim("  Adelie Penguin (Pygoscelis adeliae)  ", side = "left")
str_trunc("Adelie Penguin (Pygoscelis adeliae)", width = 18, side = "right")
str_split("Adelie Penguin (Pygoscelis adeliae)", " ")
str_c("Adelie", "Penguin", sep = "_")
penguins_clean_names |>  
  distinct(sex)
penguins_clean_names |> 
  mutate(species = case_when(
    species == "Adelie Penguin (Pygoscelis adeliae)" ~ "Adelie",
    species == "Gentoo penguin (Pygoscelis papua)" ~ "Gentoo",
    species == "Chinstrap penguin (Pygoscelis antarctica)" ~ "Chinstrap",
    .default = as.character(species)
  )
  )
#just another way to rename but with stringr
mdy("10/11/2020")
penguins_clean_names |> 
  mutate(species = stringr::word(species, 1)
  ) |> 
  mutate(sex = stringr::str_to_title(sex))
#using regex to be able to later describe what we do with stringr
penguins_clean_names |> 
  separate(
    species,
    into = c("species", "full_latin_name"),
    sep = "(?=\\()"
  ) 

#look for pattern
str_detect("Genus specificus", "Genus")
#filter data 
penguins_clean_names |> distinct(species)

penguins_clean_names |>
  filter(str_detect(species, "papua")) |>
  select(species)
#remove a pattern
str_remove("Genus specificus", pattern = "Genus ")
penguins_clean_names |> 
  separate(
    species,
    into = c("species", "full_latin_name"),
    sep = "(?=\\()" # regex pattern: split before the '('
  ) |> 
  mutate(full_latin_name = str_remove_all(full_latin_name, "[\\(\\)]"))

#DUPLICATES
penguins_clean_names |> 
  filter(duplicated(across(everything())))
sum() 

penguins_demo <- penguins_clean_names |> 
  slice(1:50) |> 
  bind_rows(slice(penguins_clean_names, c(1,5,10,15,30)))

penguins_demo |> 
  filter(!duplicated(across(everything())))

penguins_demo <- penguins_clean_names |> 
  slice(1:50) |> 
  bind_rows(slice(penguins_clean_names, c(1,5,10,15,30)))

# Keep only unduplicated data with !
penguins_demo |> 
  filter(!duplicated(across(everything())))

penguins_demo |> 
  distinct()

penguins_clean_names |> 
  summarise(
    n = n(),
    n_distinct(individual_id)
  )

#MISSING DATA
penguins_clean_names |> 
  group_by(species) |> 
  summarise(mean = mean(body_mass_g))
summary(penguins_clean_names)

penguins_clean_names |> 
  filter(if_any(everything(), is.na)) |>
  select(culmen_length_mm, culmen_depth_mm, flipper_length_mm, 
         sex, delta_15n, delta_13c,comments,
         everything()) #not working

penguins_clean_names |> 
  filter(if_any(culmen_length_mm, is.na))  # reorder columns

penguins_clean_names |> 
  drop_na()

penguins_clean_names |> 
  group_by(species) |> 
  summarise(
    mean_body_mass = mean(body_mass_g, na.rm = T)
  )
df <- tibble(
  date = c("X2020.01.22",
           "X2020.01.22",
           "X2020.01.22",
           "X2020.01.22")
)

df |> 
  mutate(
    date = as_date(date, format = "X%Y.%m.%d")
  )
week("2017-11-28T14:02:00")
day("2017-11-28T14:02:00")
excel_numeric_to_date(42370)

penguins_clean_names |> 
  summarise(min_date=min(date_egg),
            max_date=max(date_egg))
penguins_clean_names <- penguins_clean_names |> 
  mutate(year = lubridate::year(date_egg))
# return records after 2008
penguins_clean_names |>
  filter(date_egg >= ymd("2008-01-01"))

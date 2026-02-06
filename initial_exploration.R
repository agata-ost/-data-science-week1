# Week 1: Initial Data Exploration ====
# Author: Agata
# Date: 30/01/2026

# Load packages ====
library(tidyverse)
library(here)
library(naniar)
library(janitor)
library(skimr)
# Load data ====
mosquito_egg_raw <- read_csv(here( "week1", "data", "mosquito_egg_data.csv"),
                             name_repair = janitor::make_clean_names)

#basic data ovrview
glimpse(mosquito_egg_raw)
summary(mosquito_egg_raw)
skim(mosquito_egg_raw)
#look at table
view(mosquito_egg_data)

#group data
mosquito_egg_raw |> 
  group_by(site, treatment) |> 
  summarise(n = n())

# Observations ====
# Your observations (add as comments below):
# - What biological system is this?
#   Not sure.
# - What's being measured?
#   Age and weight of female mosquitos and how many eggs they laid, as well as how many of these hatched
#   at different sites.
# - How many observations?
#   57
# - Anything surprising?
#   The treatment does not seem to have an effect on eggs laid and how many hatched.
# - Any obvious problems?
#   Missing data


# FIX 1: [Issue description] ====
# Missing data in dataset
# Show the problem:
# [Code to demonstrate issue exists]


# Fix it:
#try 1
mosquito_egg_data_step1 <- mosquito_egg_data |>
  filter(if_any(everything(), is.na)) |>
  select(female_id, age_days, body_mass_mg, site, collection_date, collector, treatment, eggs_laid, eggs_hatched, everything(mosquito_egg_data))
#try 2
mosquito_egg_data_step1 |>
  filter(if_any(everything(mosquito_egg_data_step1)) is)
  
  # Verify it worked:
#did not work, going to try again.
  # [Code to check change happened]
glimpse(mosquito_egg_data_step1)
  
  # What changed and why it matters:
  # [2-3 sentences explaining consequences]
  #
  
  
  # FIX 2: [Issue description]  ====
# Dates are in the wrong format()
# Show the problem:
# [Code]

# Fix it:
mosquito_egg_data_step2 <- mosquito_egg_data_step1 |>
  # YOUR CODE
  
  
  # Verify it worked:
  # [Code]
  
  # What changed and why it matters:
  # [2-3 sentences]
  #
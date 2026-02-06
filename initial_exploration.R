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
view(mosquito_egg_raw)

#group data
mosquito_egg_raw |> 
  group_by(site, treatment) |> 
  summarise(n = n())

# Observations ====
# Your observations (add as comments below):
# - What biological system is this?
#   
# - What's being measured?
#   Age and weight of female mosquitos and how many eggs they laid, as well as how many of these hatched
#   at different sites.
# - How many observations?
#   57
# - Anything surprising?
#   The treatment does not seem to have an effect on eggs laid and how many hatched.
# - Any obvious problems?
#   Missing data
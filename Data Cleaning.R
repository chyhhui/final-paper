### Preamble ####
#Purpose: The purpose of this code is to clean up the data obtained from Toronto Police Open data. 
#Author: Chyna Hui 
#Date: 20 April 2022
#Contact: chyna.hui@mail.utoronto.ca


### Workplace Setup ###
#load in required packages 
library("tidyverse")
library("dplyr")
library('ggplot2')
library('knitr')
library('kableExtra')
library('lubridate')


# Set working directory
 #Load in raw data for Police Apprehensions
 Apprehensions_raw.csv <-
   raw_dat <- readr::read_csv("inputs/data/Apprehensions_raw.csv")
 
 ### Isolating data by Year ###
 clean_dat <-
   raw_dat |>
   filter(ReportYear %in% c(2018, 2019, 2020)) |>
   select(ReportYear, NeighbourhoodName, Sex, AgeGroup, PremisesType)|>
   rename(
     "Year"= ReportYear,
     "Neighborhood"= NeighbourhoodName,
     "Age"= AgeGroup
   )
 
 
 save(clean_dat,file="outputs/rda/clean_dat.rda")

### Create new dataframe isolating the number of Apprehensions per year ### 
 clean_year <-
   clean_dat %>% mutate()
 
 
 ### Load raw data for Dispatched Calls
 dispatched_calls_raw.csv <-
   raw_calls <- readr::read_csv("inputs/data/dispatched_calls_raw.csv")
 
 ### Isolating data by year ### 
 clean_calls <-
   raw_calls |>
   filter(Year %in% c(2018, 2019, 2020)) |>
   select(Year, Unit, Count_) |>
   rename(
     "Division"= Unit, 
     "Number"= Count_
   )
 gsub("[^0-9]", "", clean_calls$Division)
 
 save(clean_calls, file="outputs/rda/clean_calls.rda")
 
 
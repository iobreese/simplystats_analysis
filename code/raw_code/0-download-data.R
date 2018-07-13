#Read the data in
library(readtext)
library(here)
txt = readtext(here("data/raw_data/posts/")) #had to move posts up to raw_data

#Looked at data
library(dplyr)
glimpse(txt)


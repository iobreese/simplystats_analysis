#Read the data in
library(readtext)
library(here)
txt = readtext(here("data/raw_data/posts/")) #had to move posts up to raw_data

#Looked at data
library(dplyr)
glimpse(txt)

#Save as rda file
data_date = date()
save(txt,data_date,file=here("data/tidy_data",
                             "simply_data_before_processing_07-13-2018.rda"))

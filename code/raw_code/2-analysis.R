source(here("code/raw_code/1-tidying.R")) #ERROR?

#Start by getting the days
days = tidy_txt %>% 
  group_by(title) %>% 
  summarize(date=first(date),author = first(author)) 

#Count the days of posts
days %>% mutate(wd=weekdays(date)) %>%
  group_by(author) %>% count(wd)

#Count word frequency by author
wc_data = tidy_txt %>% group_by(author) %>%
  count(word) %>% spread(author,n) %>% 
  select(word,jeff,rafa,roger) %>% 
  filter(!is.na(jeff) & !is.na(rafa) & !is.na(roger))

#Make this a matrix
rn = wc_data$word
wc_mat = wc_data %>% select(jeff,rafa,roger) %>%
  data.matrix()
rownames(wc_mat) = rn

#Make the plot
library(wordcloud)
comparison.cloud(wc_mat)

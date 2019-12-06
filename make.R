# sources
source("R/packages.r")
source("R/functions.R")

# data input
# corpus <- load_corpus()

# conversion as data frame
# this stage is better avoided because it is very, very slow...!
# corpus_df <- corpus_dbf(corpus)

# running the search_taxa function
search_df <- search_taxa()

# joinning the "animal" and "plant" columns to the original dataframe
search_df <- search_df %>% 
  select(UT, animal, plant)
corpus_df <- left_join(corpus_df, search_df)

animal_corpus <- subset(corpus_df, corpus_df$animal == "yes")
plant_corpus <- subset(corpus_df, corpus_df$plant == "yes")
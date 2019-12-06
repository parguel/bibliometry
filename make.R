# sources
source("R/packages.r")
source("R/functions.R")

# data input
corpus <- load_corpus()

# conversion as data frame
# this stage is better avoided because it is very, very slow...!
corpus_df <- corpus_dbf(corpus)


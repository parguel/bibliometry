
# first function : load all WOS files in the data directory
load_corpus <- function() {
  
  a <- list.files(path="./data/WOS_raw_data/", full.names = TRUE)
  a <- subset(a, str_detect(a, ".bib"))
  
  corpus <- readFiles(a)
  # return(corpus)
}

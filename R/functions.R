
# first function : load all WOS files in the data directory
load_corpus <- function() {
  
  a <- list.files(path="./data/WOS_raw_data/", full.names = TRUE)
  a <- subset(a, str_detect(a, ".bib"))
  
  corpus <- readFiles(a)
  # return(corpus)
}

# convert corpus to dataframe (this is slow!) 
corpus_dbf <- function(corpus){
  corpus_df <- convert2df(corpus, dbsource = "isi", format = "bibtex") # very slow!!
  corpus_df <- cbind(corpus_df, taxa = c(rep(NA, length(corpus_df$AU))))
  
  save(corpus_df, file = "output/convertedcorpus")
}

# function to identify the taxa (animal / plant)
search_taxa <- function() {
  
  load(file = "output/convertedcorpus")
  # creating the sub-dataframe to search in
  search_df <- corpus_df %>% 
    select(UT, TI, AB, DE) %>% 
    remove_rownames() %>% 
    unite("search_mix", TI:DE) %>% 
    add_column(animal = NA, plant = NA)
  
  # replacing special caracters and removing multiple spaces
  search_df$search_mix <- gsub('[[:punct:] ]+',' ', search_df$search_mix)
  
  # list of the words to search 
  animal_words = c(" animal "," mammal "," mammals "," bird "," birds "," amphibian "," amphibians "," reptile "," reptiles "," insect "," insects ", " crab "," crabs ")
  plant_words = c(" plant "," plants "," gymnosperm "," gymnosperms "," angiosperm "," angiosperms ")
  
  # searching keywords in titles, abstracts and author keywords
  for (i in 1:length(search_df$UT)) {
    article_search_mix = search_df$search_mix[i]
    
    # search of the animal keywords
    for (n in 1:length(animal_words)){
      if (grepl(animal_words[n], article_search_mix, ignore.case = TRUE)) {
        search_df$animal[i] <- "yes"
      }
    }
    
    # search of the plant keywords
    for (n in 1:length(plant_words)){
      if (grepl(plant_words, article_search_mix, ignore.case = TRUE)) {
        search_df$plant[i] <- "yes"
      }
    }
  }
  
  
}


# first function : load all WOS files in the data directory
load_corpus <- function() {
  
  a <- list.files(path="./data/WOS_raw_data/", full.names = TRUE)
  a <- subset(a, str_detect(a, ".bib"))
  
  corpus <- readFiles(a)
  # return(corpus)
}

# function to identify the taxa (animal / plant)
search_taxa <- function() {
  
  # creating the sub-dataframe to search in
  search_df <- corpus_df %>% 
    select(UT, TI, AB, DE) %>% 
    remove_rownames() %>% 
    summarize(search_mix = paste0(TI, AB, DE,collapse = " ")) %>% 
    add_column(animal = NA, plant = NA)
  
  
  # replacing special caracters and removing multiple spaces
  search_df <- search_df %>% 
    str_replace_all(".", " ")
    
  data <- '"I am a, new comer","to r,"please help","me:out","here"'
  gsub('[[:punct:] ]+',' ',data)
  # [1] " I am a new comer to r please help me out here "
  
  # list of the words to search 
  animal_words = c(" animal "," mammal "," mammals "," bird "," birds "," amphibian "," amphibians "," reptile "," reptiles "," insect "," insects ")
  plant_words = c(" plant "," plants "," gymnosperm "," gymnosperms "," angiosperm "," angiosperms ")
  
  # searching keywords in titles, abstracts and author keywords
  for (i in 1:length(search_df$UT)) {
    article_search_mix = search_df$search_mix[i]
    
    grepl("toyota", 'TOYOTA subaru', ignore.case = TRUE)

    
  }
    
 }
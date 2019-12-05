
# first script to explore the dataset

corpus <- load_corpus()

corpus_df <- convert2df(corpus, dbsource = "isi", format = "bibtex")
corpus_df <- cbind(corpus_df, taxa = c(rep(NA, length(corpus_df$AU))))

results <- biblioAnalysis(corpus_df, sep = ";")

summary(results)

plot(x = results, k = 10, pause = FALSE)

# Create keyword co-occurrences network

NetMatrix <- biblioNetwork(corpus_df, analysis = "co-occurrences", network = "keywords", sep = ";")

# Plot the network
net = networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Co-occurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)


### THE SCRIPT BEGINS ###
library(stylo)
library(tictoc)

tic()

# xx1 - for words; xx2 - for characters

milestone_labels = c("", "100 AH", "200 AH", "300 AH", "400 AH", "500 AH", "600 AH")

# Parameters: words, characters
# Parameters: classification methods: "delta", "svm", "nsc"
# - support vector machine
# - nearest shrunken centroids
# - delta
# Parameters: MFW

classifiers = c("svm", "delta", "nsc")
mfwVector   = c(100, 300, 500)
featType    = c("w", "c") 


for (iii in featType){
  if (iii == "w"){
    featType = "w"
    featLen  = "1"
    incr = 1
  } else {
    featType = "c"
    featLen  = "2"
    incr = 2
  }
  
  for (i in classifiers){
    for (ii in mfwVector){
      
      cat(paste("\n\n========Generating:", i, "for", ii, "features (", featType, featLen, ")========\n\n"))
      rolling.classify(write.pdf.file = TRUE, corpus.lang="Other",
                       analyzed.features = featType, ngram.size = featLen,
                       classification.method = i, mfw=ii+incr,
                       use.existing.freq.tables = TRUE,
                       training.set.sampling = "normal.sampling",
                       slice.size = 5000, slice.overlap = 4500,
                       milestone.labels = milestone_labels)
      
    }
  }
}

toc()

# 1923.831 sec elapsed (32 mins on MacBook Pro 2018)

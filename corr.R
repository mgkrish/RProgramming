corr <- function (directory, threshold = 0) {
	 ## Get files from the directory and store in variable
	filelist <- list.files(directory, full.names = TRUE)

	 ## create empty data frame
	goodata <- complete(directory)

	 # check threshold
	validfileids <- goodata[goodata$nobs > threshold, 1]

	 # return vector
	corVec <- c()

	for (i in validfileids) {
		data <- read.csv(filelist[i])
		goodData <-data[complete.cases(data), ] #read good data
		##cor gooddata with everything
		corrData <- cor(goodData$sulfate, goodData$nitrate, use = "everything")
		#add vector with existing vector
		corVec <- c(corVec, corrData)
	}

	corVec

}
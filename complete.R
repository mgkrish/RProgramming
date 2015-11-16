complete <- function (directory, id = 1 : 332) {
	 ## 'directory' is a character vector of length 1 indicating
	 ## the location of the CSV files

	 ## Get files from the directory and store in variable
	filelist <- list.files(directory, full.names = TRUE)

	 ## create empty data frame
	allgoodata <- data.frame()

	for (i in id) {
		data <- read.csv(filelist[i]) ## read file
		gooddata <-data[complete.cases(data), ] ## eliminate bad data
		allgoodata <- rbind(allgoodata, data.frame(i, nobs=nrow(gooddata))) ## rebind to parent data
	}
	allgoodata

}
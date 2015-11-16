pollutantmean <- function(directory, pollutant, id = 1:332) {

  ## Get files from the directory  and store in variable
  filelist <- list.files(directory, full.names=TRUE)

  ##create empty data frame and bind tables
  alldata <- data.frame()
  for (i in id){
    alldata <- rbind(alldata, read.csv(filelist[i]))
  }

  ##take subset for pollutant
  pollutantsubset <- alldata[, pollutant]

 ##take mean and set na remove to true
  mean(pollutantsubset , na.rm=TRUE)
}
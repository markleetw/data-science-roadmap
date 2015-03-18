pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # remove variable if exists
  if(exists("selectedData"))
    rm(selectedData)
  
  for(i in id[id >= 1 & id <= 332]) { # loop start
    
    # convert id to file name
    if(str_length(i) == 1) {
      fileName <- paste("00", i, ".csv", sep = "")
    } else if(str_length(i) == 2) {
      fileName <- paste("0", i, ".csv", sep = "")
    } else {
      fileName <- paste(i, ".csv", sep = "")
    }
    
    # read file to data.frame
    iCsv <- read.csv(paste(directory, fileName, sep = "//"))
    
    # merge all selected files to one data.frame
    if(exists("selectedData")) {
      selectedData <- merge(selectedData, iCsv, all = T)
    } else {
      selectedData <- iCsv
    }
    
  } # loop end
  
  # get pollutant data from data.frame
  pollutantData <- selectedData[[pollutant]]
  
  # calculate mean value from non-NA data, and rounding 3 digits
  round(mean(pollutantData[!is.na(pollutantData)]), digits = 3)
}
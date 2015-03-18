pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  # remove variable if exists
  if(exists("selectedData"))
    rm(selectedData)
  
  for(i in id[id >= 1 & id <= 332]) { # loop start
    
    # convert id to file name
    if(nchar(i) == 1) {
      fileName <- paste("00", i, ".csv", sep = "")
    } else if(nchar(i) == 2) {
      fileName <- paste("0", i, ".csv", sep = "")
    } else {
      fileName <- paste(i, ".csv", sep = "")
    }
    
    # read file to data.frame
    iCsv <- read.csv(paste(directory, fileName, sep = "//"))
    
    # merge all selected files to one data.frame
    if(exists("selectedData")) {
      selectedData <- append(selectedData, iCsv[[pollutant]])
    } else {
      selectedData <- iCsv[[pollutant]]
    }
    
  } # loop end
  
  # calculate mean value from non-NA data, and rounding 3 digits
  round(mean(selectedData[!is.na(selectedData)]), digits = 3)
}
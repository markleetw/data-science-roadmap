pollutantmean <- function(directory, pollutant, id = 1:332) {
    source("getDataFrameFromId.R")
    
    # remove variable if exists
    if(exists("selectedData"))
        rm(selectedData)
    
    for(i in id[id >= 1 & id <= 332]) { # loop start
        iCsv <- getDataFrameFromId(directory, i)
        
        # merge all selected data into one vector
        if(exists("selectedData")) {
            selectedData <- c(selectedData, iCsv[[pollutant]])
        } else {
            selectedData <- iCsv[[pollutant]]
        }
        
    } # loop end
    
    return(mean(selectedData, na.rm = TRUE))
}
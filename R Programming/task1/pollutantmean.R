pollutantmean <- function(directory, pollutant, id = 1:332) {
    source("getDataFrameFromId.R")
    
    # remove variable if exists
    if(exists("selectedData"))
        rm(selectedData)
    
    for(i in id[id >= 1 & id <= 332]) { # loop start
        iCsv <- getDataFrameFromId(directory, i)
        
        # merge all selected data into one vector
        if(exists("selectedData")) {
            selectedData <- append(selectedData, iCsv[[pollutant]])
        } else {
            selectedData <- iCsv[[pollutant]]
        }
        
    } # loop end
    
    round(mean(selectedData, na.rm = TRUE), digits = 3)
}
getDataFrameFromId <- function(directory, id) {
    
    # generate file name from id
    fileName <- sprintf("%03d", as.numeric(id))
    
    # return csv file to data frame
    return(read.csv(paste(directory, "/", fileName, ".csv", sep = "")))
}
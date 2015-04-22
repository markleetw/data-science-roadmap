complete <- function(directory, id = 1:332) {
    source("getDataFrameFromId.R")
    
    nobsNum <- numeric(0)
    for(i in id) { # loop start
        iCsv <- getDataFrameFromId(directory, i)
        iCsv <- iCsv[!is.na(iCsv$sulfate) & 
                         !is.na(iCsv$nitrate),]
        nobs <- c(nobs, nrow(iCsv))
    } # loop end
    return(data.frame(id = id, nobs = nobs))
}
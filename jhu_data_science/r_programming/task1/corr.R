corr <- function(directory, threshold = 0) {
    source("getDataFrameFromId.R")
    
    com <- complete(directory)
    selectedId <- com[com$nobs > threshold,]$id
    corResult <- numeric(0)
    for(i in selectedId) {
        iCsv <- getDataFrameFromId(directory, i)
        corr <- cor(iCsv$sulfate, iCsv$nitrate, use = "pairwise.complete.obs")
        corResult <- c(corResult, corr)
    }
    return(corResult)
}
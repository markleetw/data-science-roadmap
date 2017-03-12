rankall <- function(outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("data/outcome-of-care-measures.csv", colClass = "character")
    
    ## Check that state and outcome are valid
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if(!any(outcomes == outcome)) {
        stop("invalid outcome")
    }
    
    ## For each state, find the hospital of the given rank
    ## Return a data frame with the hospital names and the
    ## (abbreviated) state name
    if(outcome == "heart attack") {
        cLabel <- 11
    } else if(outcome == "heart failure") {
        cLabel <- 17
    } else {
        cLabel <- 23
    }
    if(num == "best") {
        num <- 1
    }
    selectedData <- data[, c(2, 7, cLabel)]
    selectedData[, 3] <- as.numeric(selectedData[, 3])
    selectedData <- selectedData[complete.cases(selectedData),]
    selectedData <- selectedData[order(selectedData[, 2], selectedData[, 3], 
                                       selectedData[, 1]),]
    if(num == "worst") {
        result <- as.data.frame(tapply(selectedData[, 1], selectedData[, 2], 
                                       function(x) x[length(x)]))
    } else {
        result <- as.data.frame(tapply(selectedData[, 1], selectedData[, 2], 
                                       function(x) x[num]))
    }
    result <- cbind(result, row.names(result))
    colnames(result) <- c("hospital", "state")
    return(result)
}

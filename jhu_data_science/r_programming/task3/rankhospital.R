rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    data <- read.csv("data/outcome-of-care-measures.csv", colClass = "character")
    
    ## Check that state and outcome are valid
    if(!any(data$State == state)) {
        stop("invalid state")
    }
    
    outcomes <- c("heart attack", "heart failure", "pneumonia")
    if(!any(outcomes == outcome)) {
        stop("invalid outcome")
    }
    
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    
    if(outcome == "heart attack") {
        cLabel <- 11
    } else if(outcome == "heart failure") {
        cLabel <- 17
    } else {
        cLabel <- 23
    }
    if(num == "best") {
        num <- 1
    } else if(num =="worst") {
        num <- -1
    }
    selectedData <- data[data$State == state, c(2, cLabel)]
    selectedData[, 2] <- as.numeric(selectedData[, 2])
    selectedData <- selectedData[complete.cases(selectedData),]
    selectedData <- selectedData[order(selectedData[, 2], selectedData[, 1], 
                                       decreasing = (num < 0)),]
    selectedData[abs(num), 1]
    
}

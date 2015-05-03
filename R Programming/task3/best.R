best <- function(state, outcome) {
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
    
    ## Return hospital name in that state with lowest 30-day death
    ## rate
    
    if(outcome == "heart attack") {
        cLabel <- 11
    } else if(outcome == "heaert failure") {
        cLabel <- 17
    } else {
        cLabel <- 23
    }
    selectedData <- data[data$State == state, c(2, cLabel)]
    selectedData[, 2] <- as.numeric(selectedData[, 2])
    return(selectedData[selectedData[,2] == min(selectedData[, 2], na.rm = TRUE) 
                        & complete.cases(selectedData), 1])
}
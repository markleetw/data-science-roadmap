## Caching the inverse matrix can save more time than compute it repeatedly.

## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to:
## set the value of the matrix
## get the value of the matrix
## set the value of the inverse matrix
## get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    invMatrix <- NULL
    set <- function(y) {
        x <<- y
        invMatrix <<- NULL
    }
    get <- function() x
    setInvMatrix <- function(m) invMatrix <<- m
    getInvMatrix <- function() invMatrix
    list(set = set, get = get, setInvMatrix = setInvMatrix, 
         getInvMatrix = getInvMatrix)
}


## This function calculates the inverse matrix of the special "matrix"
## created with the above function. 

cacheSolve <- function(x, ...) {
    m <- x$getInvMatrix()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setInvMatrix(m)
    ## Return a matrix that is the inverse of 'x'
    m
}

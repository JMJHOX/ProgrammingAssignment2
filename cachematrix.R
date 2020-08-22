## Put comments here that give an overall description of what your
## functions do

#*The function "makeCacheMatrix" creates a object that can set a matrix
#and its inverse separately

makeCacheMatrix <- function(x=matrix()) {
  m <- NULL
  setMatrix <- function(y) {
    x <<- y
    m <<- NULL}

getMatrix <- function()x
getInverse <- function()m 
setInverse <- function(solve)m <<-solve
list(getMatrix = getMatrix,setMatrix=setMatrix,getInverse=getInverse
     ,setInverse=setInverse)
}


#"cacheSolve" determines if the matrix has a inverse. If not,will return 
#a new inverse and save it as cache for future calculations. 
cacheSolve <- function(x, ...) {
      if(!is.null(x$getInverse()) && !is.na(x$getInverse()))
        {
        print("Getting cached inverse")
        return(x$getInverse())
        }
        
      else if(is.null(x$getInverse()) && !is.null(x$getMatrix()))
        { 
        newInv <- solve(x$getMatrix()) 
          print("The new inverse is:")
          x$setInverse(newInv)
          return (newInv)
        }
        else
        {
          print("error: Please enter a valid Matrix to determine its inverse")
        }
        
}

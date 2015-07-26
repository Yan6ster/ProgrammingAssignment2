##main function with arguement x that contains 4 other functions in it
##arguement x is the input(matrix) to be inversed
makeCacheMatrix <- function(x){
  i <- NULL   ## to ensure initial value is null
  
  ## set function is used to change value of x in main function 
  set <- function(y) { 
    x <<- y   ## value y will substitue value x in makeCacheMatrix
    i <<- NULL ## value i is replaced with NULL
  }
  
  get <- function() x  ##return value of x from main function
  setinverse <- function(solve) i <<- solve ##value solve(not calculated value) is stored in variable i and the setinverse 
  getinverse <- function() i ##return value i that was set in setinverse or in the main function
  
  ##a list to store all the functions within a function
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##function used to check if there is values stored for in the makeCacheMatrix getinverse and to find inverse of value specified
cacheSolve <- function(m, ...) {
  i <- m$getinverse() ##look up the cache to take the value in it to be placed in i
  
  ##if function is used to find whether there is value in i
  if(!is.null(i)) {
    message("getting inverse data")  ##display message if value i is not null
    return(i)  ##return value i
  }
  data <- m$get()  ##return the value x from makeCacheMatrix and place it in variable data
  i <- solve(data, ...) ##use solve to inverse the value in data and place it in i
  m$setinverse(i) ##store value i above into setinverse in makeCacheMatrix to serve as a cache
  i ##show value of i
}


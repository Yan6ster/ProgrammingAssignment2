##main function with arguement x that contains 4 other functions in it
##
makeCacheMatrix <- function(x){
  i <- NULL   ## to ensure initial value is null
  
## set function changes value of x in main function 
  set <- function(y) { 
    x <<- y   ## value y will substitue value x in makeCacheMatrix
    i <<- NULL ## value i in main funciton is replaced with NULL
  }

  get <- function() x  ##return value of x from main function
  setinverse <- function(solve) i <<- solve ##value solve(not calculated value) is stored in variable i and the setinverse 
  getinverse <- function() i ##return value i that was set in setinverse or in the main function
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)##a list to store all the functions within a function
  
}


##
cacheSolve <- function(x, ...) {
  i <- x$getinverse() ##look up the cache to take the value in it to be placed in i
  
  ##if function is used to find whether there is value in i
  if(!is.null(i)) {
    message("getting inverse data")  ##display message if value i is not null
    return(i)  ##return value i
  }
  data <- x$get()  ##get the arguement x
  i <- solve(data, ...) ##use solve to inverse the data
  x$setinverse(m)
  i
}


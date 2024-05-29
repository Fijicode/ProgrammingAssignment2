
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Function to create a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  cached_inverse <- NULL  # Initialize the cached inverse as NULL
  
  # Function to set the matrix
  setMatrix <- function(new_matrix) {
    matrix_data <<- new_matrix  # Use the superassignment operator to set the matrix
    cached_inverse <<- NULL  # Reset the cached inverse
  }
  
  # Function to get the matrix
  getMatrix <- function() {
    matrix_data
  }
  
  # Function to set the cached inverse
  setInverse <- function(inverse_matrix) {
    cached_inverse <<- inverse_matrix
  }
  
  # Function to get the cached inverse
  getInverse <- function() {
    cached_inverse
  }
  
  # Return a list of the above functions
  list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)

}


## Write a short comment describing this function

# Function to compute the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  cached_inverse <- cache_matrix_obj$getInverse()  # Retrieve the cached inverse, if it exists
  
  if (!is.null(cached_inverse)) {
    message("getting cached data")
    return(cached_inverse)
  }
  
  matrix_data <- cache_matrix_obj$getMatrix()  # Get the matrix
  cached_inverse <- solve(matrix_data, ...)  # Compute the inverse
  cache_matrix_obj$setInverse(cached_inverse)  # Cache the computed inverse
  
  cached_inverse
}

# makeCacheMatrix() creates a special "matrix" object that
# can cache its inverse.
#
# The <<- operator is used to assign a value to an object in an
# environment that is different from the current environment.
#
# Computing the inverse of a square matrix can be done
# using solve(). If 'x' is a square matrix, solve(x) will
# return its inverse.
#
#################################################################
#
# makeCacheMatrix(x)
#
#################################################################
makeCacheMatrix <- function(x = matrix()) {
  # stores the cached value
  # initialize to NULL
  cache <- NULL
  
  # create the matrix in the working environment
  set <- function(y) {
    x <<- y
    cache <<- NULL
  }
  
  # get the value of the matrix
  get <- function() x
  # invert the matrix and store in cache
  setMatrix <- function(inverse) cache <<- inverse
  # get the inverted matrix from cache
  getInverse <- function() cache
  
  # return the created functions to the working environment
  list(set = set, get = get,
       setMatrix = setMatrix,
       getInverse = getInverse)
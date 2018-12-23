#' An S4 class to represent a queue.
#'
#' @slot arr A numeric \code{vector} indicating the values of the queue. 
#'     Not accessable to the user. 
#' @slot size A number indicating the number of elements in the queue.
#' @return An S4 class specifying a queue. 
#' @rdname queue-class
#' @exportClass "queue"
queue <- setClass(
  Class = "queue",
  
  # Define the slots
  slots = list(
    arr = "vector",
    size = "numeric"
  ),
  
  prototype = list(
    arr = numeric(0), 
    size = 0
  )
)

#' Constructor for class
#' 
#' @include isNumberVector.R
#' @export queue
queue <- function(arr) {
  if ( !is.number.vector(arr) ) {
    stop("Error! Arr must be numeric")
  }
  return( new("queue", arr = arr, size = length(arr)) )
}

#' pop
#' 
#' @description A function used to remove the oldest value from a queue.
#' 
#' @param \code{object} - An object of class \code{queue}.
#' 
#' @include RcppExports.R
#' @exportMethod pop
setMethod(f = "pop",
          signature = "queue",
          definition = function(object) {
            out <- popC( slot(object, "size"),
                         slot(object, "arr") )
            
            object@arr = getElement( getElement(out, "queue"), 
                                     "arr")
            object@size = getElement( getElement(out, "queue"), 
                                      "size")
            
            return(out$val)
          } )

#' Push
#' 
#' @description A function used to push a new value to a queue.
#' 
#' @param \code{object} - An object of class \code{queue}.
#' 
#' @include RcppExports.R
#' @exportMethod push
setMethod(f = "push", signature = "queue",
          definition = function(object, val) {
            
            obj.tmp <- pushC( slot(object, "size"), 
                              slot(object, "arr"), 
                              val)
            
            print(obj.tmp)
            
            ## reassign
            ## object@size <- getElement(obj.tmp, "size")
            ## object@arr <- getElement(obj.tmp, "arr")
            object <<- obj.tmp
          } )


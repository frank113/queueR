## template from https://www.cyclismo.org/tutorial/R/s4Classes.html

queue <- setClass(
  # Set the name for the class
  "queue",
  
  # Define the slots
  slots <- list(
    arr = "vector",
    size = "numeric"
  ),
  
  prototype=list(
    arr = numeric(0), 
    size = 0
  ),
  
  validity=function(object)
  {
    if ( !is.numeric(object@arr) ) {
      return("Non-numeric array passed to queue")
    }
    
    if ( !object@size < 0 || object@size != length(object@arr) ) {
      return("Incorrectly specified size")
    }
    return(TRUE)
  }
)

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


setMethod("push", signature(object = "queue", val = "numeric"), 
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


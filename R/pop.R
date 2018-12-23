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





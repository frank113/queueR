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


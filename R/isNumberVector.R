is.number.vector <- function(arr) {
  if ( !is.vector(arr) || 
       !( typeof(arr) != "integer" || typeof(arr) != "double" ) || 
       !( class(arr) != "numeric" || class(arr) != "integer" ) ) {
    return(FALSE)
  }
  return(TRUE)
}

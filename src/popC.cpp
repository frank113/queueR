#include <Rcpp.h>
#include <vector>

using namespace Rcpp;

// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//



// [[Rcpp::export]]
Rcpp::List popC(int size, Rcpp::NumericVector arr) {
  // returns a list of lenght 2 where the first element is the val
  // second one is the struct
  if ( arr.size() == 0 ) {
    throw(Rcpp::exception("Cannot pop from queue of size 0"));
  }
  
  double ans;
  ans = arr( 0 );
  
  // remove the first element
  arr.erase( 0 );
  
  int newSize = size - 1;
  return Rcpp::wrap(Rcpp::List::create(
      Rcpp::Named("queue") = Rcpp::List::create(Rcpp::Named("size") = newSize,
                                        Rcpp::Named("arr") = arr),
      Rcpp::Named("value") = ans));
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//


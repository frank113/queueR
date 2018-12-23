#include <Rcpp.h>
#include <vector>

using namespace Rcpp;

// [[Rcpp::export]]
Rcpp::List pushC(int size, Rcpp::NumericVector arr, double val) {
  // returns a list of the struct
  
  arr.push_back(val);
  
  int newSize = size + 1;
  return Rcpp::wrap(Rcpp::List::create(Rcpp::Named("size") = newSize,
                                        Rcpp::Named("arr") = arr));
}


// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//


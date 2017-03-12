meanOfHundredRNorm = function() {
  x = rnorm(100)
  mean(x)
}

meanOfRNorm = function(x) {
  x = rnorm(length(x))
}
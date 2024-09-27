coeficients = function(X, Y) {
  return(solve(t(X) %*% X) %*% t(X) %*% Y)
}


residuals_reg = function(X, Y, beta_hat) {
  return(Y - (X %*% beta_hat))
}

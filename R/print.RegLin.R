#' @title Método de Impressão para RegLin
#' @description Exibe os coeficientes do modelo de forma legível.
#' @param x Um objeto da classe RegLin.
#' @param ... Outros argumentos (não utilizados).
#' @export
print.RegLin = function(x, ...) {
  cat("Call:\n")
  print(x$call)

  rss = sum(x$residuals^2)
  X = x$X
  n = nrow(X)
  p = ncol(X)
  df = n - p

  sigma_squared = rss / df

  var_beta = sigma_squared * diag(solve(t(X) %*% X))
  std_error = sqrt(var_beta)
  t_values = x$coefficients / std_error
  p_values = 2 * pt(-abs(t_values), df = df)

  cat("\nCoeficientes:\n")

  m = matrix(c(x$coefficients, std_error, t_values, p_values), nrow = nrow(x$coefficients))
  colnames(m) = c("Estimate", "Std. Error", "t-value", "p-value")
  rownames(m) = c("Intercepto", rownames(x$coefficients)[-1])

  print(m)

  r_squared = 1 - (sum(x$residuals^2))/(sum((x$Y - mean(x$Y))^2))
  adj_r_squared = 1 - (1 - r_squared) * ((nrow(x$X) - 1) / (nrow(x$X) - ncol(x$X)))

  cat("\nR2:", formatC(r_squared, digits = 4), "\n")
  cat("R2 Ajustado:", formatC(adj_r_squared, digits = 4), "\n")
}


#' @title Método de Impressão para RegLin
#' @description Exibe os coeficientes do modelo de forma legível.
#' @param x Um objeto da classe RegLin.
#' @param ... Outros argumentos (não utilizados).
#' @export
print.RegLin = function(x, ...) {
  cat("Modelo de Regressão Linear:\n")
  print(x$formula)
  cat("Coeficientes:\n")
  print(x$coefficients)
}

#' @title Método de Predição para RegLin
#' @description Gera Predições para um modelo de regressão linear.
#' @param x Um objeto da classe RegLin.
#' @param newdata Novo banco de dados
#' @param ... Outros argumentos (não utilizados).
#' @export
predict.RegLin = function(model,newdata) {
  coef_names = rownames(model$coefficients)[-1]
  if (!all(coef_names %in% colnames(newdata))) {
    stop("As variáveis do modelo não correspondem às colunas de newdata.")
  }
  newdata_aligned = as.matrix(newdata[,coef_names])
  newdata_with_intercept = cbind(1,newdata_aligned)
  predictions = newdata_with_intercept %*% model$coefficients
  return(as.vector(predictions))
}

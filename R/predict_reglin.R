#' @title Predição com base em um modelo de regressão múltipla
#'
#' @description Esta função realiza predições a partir de um modelo de regressão múltipla ajustado.
#' Os coeficientes do modelo são usados para prever novos valores com base em novos dados fornecidos.
#'
#' @param model Lista contendo os coeficientes estimados pelo modelo de regressão múltipla.
#' A lista deve conter pelo menos o elemento `coefficients`, que são os coeficientes estimados.
#' @param newdata Um data frame contendo as novas observações para as quais as predições serão feitas.
#' As colunas devem corresponder às variáveis explicativas usadas no ajuste do modelo.
#'
#' @return Retorna um vetor de valores numéricos contendo as predições feitas com base em `newdata`.
#'
#' @examples
#' # Semente
#' set.seed(1)
#' # Ajuste de um modelo de regressão múltipla
#' model = RegLin(y ~ x1 + x2, data = exampleData)
#'
#' # Novos dados para predição
#' newdata = data.frame(x1 = runif(2), x2 = runif(2, 10, 20))
#' predict_reglin(model, newdata)
#'
#' @export
predict_reglin = function(model,newdata) {
  coef_names = rownames(model$coefficients)[-1]
  if (!all(coef_names %in% colnames(newdata))) {
    stop("As variáveis do modelo não correspondem às colunas de newdata.")
  }
  newdata_aligned = as.matrix(newdata[,coef_names])
  newdata_with_intercept = cbind(1,newdata_aligned)
  predictions = newdata_with_intercept %*% model$coefficients
  return(predictions)
}

#' @title Ajuste de um modelo de regressão múltipla
#'
#' @description Esta função ajusta um modelo de regressão múltipla com base na fórmula fornecida e nos dados.
#' Ela retorna os coeficientes estimados, os resíduos, os valores ajustados, e as variáveis dependente e independentes.
#'
#' @param formula Uma fórmula R especificando o modelo de regressão no formato `Y ~ X1 + X2 + ... + Xn`, onde `Y` é a variável dependente e `X1`, `X2`, ..., `Xn` são as variáveis independentes.
#' @param data Um data frame contendo os dados que serão utilizados para ajustar o modelo. As colunas devem corresponder às variáveis especificadas na fórmula.
#'
#' @return Retorna uma lista com os seguintes elementos:
#' \describe{
#'   \item{data}{Data frame utilizado.}
#'   \item{coefficients}{Os coeficientes estimados.}
#'   \item{residuals}{Os resíduos do modelo.}
#'   \item{fitted.values}{Os valores ajustados pelo modelo.}
#'   \item{call}{Função utilizada para realizar a regressão.}
#'   \item{formula}{Formula utilizada para realizar a regressão.}
#'   \item{X}{A matriz de design utilizada no ajuste do modelo.}
#'   \item{Y}{O vetor da variável dependente.}
#' }
#'
#' @examples
#' # Ajuste de um modelo de regressão múltipla
#' model = RegLin(y ~ x1 + x2, data = exampleData)
#' model
#'
#' @export
RegLin = function(formula, data) {
  terms = all.vars(formula)
  Y = data[[terms[1]]]
  X_vars = terms[-1]
  X = as.matrix(cbind(1, data[X_vars]))

  if (is.character(Y) | is.factor(Y) | is.character(X) | is.factor(X)) {
    stop("Y e X devem ser apenas numéricos.")
  }

  for (i in 2:ncol(X)) {
    if (all(X[, i] == X[1, i])) {
      stop("Uma ou mais variáveis em X são constantes.")
    }
  }

  beta_hat = coeficients(X, Y)

  resultado = list(
    coefficients = beta_hat,
    residuals = residuals_reg(X, Y, beta_hat),
    fitted.values = fitted_values(X, beta_hat),
    call = match.call(),
    formula = formula,
    data = data,
    X = X,
    Y = Y
  )

  class(resultado) = "RegLin"
  return(resultado)
}




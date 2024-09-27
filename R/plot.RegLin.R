#' @title Método de Plotagem para RegLin
#' @description Gera gráficos diagnósticos para um modelo de regressão linear.
#' @param x Um objeto da classe RegLin.
#' @param ... Outros argumentos (não utilizados).
#' @export
plot.RegLin = function(x, ...) {
  par(ask = TRUE)

  # Gráfico de Preditos vs Observados
  plot(x = x$fitted.values, y = x$Y, pch = 19, main = "Preditos vs Observados",
       xlab = "Preditos", ylab = "Observados")
  abline(0, 1, col = "red")  # Linha de referência 45°

  # QQPlot dos Resíduos
  qqnorm(x$residuals, pch = 19, main = "QQPlot dos Resíduos")
  qqline(x$residuals, col = "red")  # Linha de referência

  # Histograma dos Resíduos
  hist(x$residuals, main = "Histograma dos Resíduos",
       xlab = "Resíduos", breaks = 10, col = "lightblue", border = "black")

  # ACF dos Resíduos
  acf(x$residuals, main = "ACF dos Resíduos")

  par(ask = FALSE)
}

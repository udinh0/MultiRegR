test_that("predict_reglin", {
  model = RegLin(y ~ x1 + x2, data = exampleData)
  newdata = data.frame(y = runif(2, 30, 40), x1 = runif(2), x2 = runif(2, 10, 20))

  expect_error(predict_reglin(model))
  expect_error(predict_reglin("model"))
  expect_error(predict_reglin(model, "newdata"))
  expect_no_error(predict_reglin(model, newdata))
  expect_type(predict_reglin(model, newdata), "double")
})

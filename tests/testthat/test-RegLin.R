test_that("RegLin", {
  expect_no_error(RegLin(y ~ x1 + x2, data = exampleData))
  expect_error(RegLin(y ~ x1 + x2 + char, data = exampleData))
  expect_error(RegLin(y ~ x1 + x2 + const, data = exampleData))
  expect_error(RegLin(y ~ x1 + x2 + char + const, data = exampleData))
  expect_type(RegLin(y ~ x1 + x2, data = exampleData), "list")
})


context("Truncated matrix")

test_that("trunc_mat output matches known output", {
  expect_output_identical(
    print(tbl_df(mtcars), n = 8L, width = 30L),
    "mtcars-8-30.txt")

  expect_output_identical(
    print(tbl_df(iris), n = 5L, width = 30L),
    "iris-5-30.txt")

  expect_output_identical(
    print(tbl_df(iris), n = 3L, width = 5L),
    "iris-3-5.txt")

  expect_output_identical(
    print(df_all, n = NULL, width = 30L),
    "all--30.txt")

  expect_output_identical(
    print(data_frame(a = character(), b = logical()), width = 30L),
    "zero_rows--30.txt")

  expect_output_identical(
    print(tbl_df(iris)[character()], n = 5L, width = 30L),
    "zero_cols-5-30.txt")

  expect_output_identical(
    print(trunc_mat(df_all, n = 1L, n_extra = 2L, width = 30L)),
    "all-1-30-2.txt")

  knit <- knitr::knit_print(trunc_mat(df_all, width = 60L))
  expect_output_identical(
    print(knit),
    "knit.txt")
  expect_is(knit, "knit_asis")
  expect_true(attr(knit, "knit_cacheable"))
})


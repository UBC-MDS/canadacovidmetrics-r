test_that("Function returns a dataframe", {
  expect_true(is.data.frame(total_cumulative_recovered_cases()))
  # add your function here
})

test_that("Function default args return non-empty dataframe", {
  expect_false(is.null(dim(total_cumulative_recovered_cases())))
  # add your function here
})

test_that("Function returns dataframe with correct columns", {
  expect_true(all(colnames(total_cumulative_recovered_cases()) == c("cumulative_recovered", "date_recovered", "province", "recovered")))
  # add your function here
})

test_that("Function returns data filtered to specified date", {
  expect_true(length(unique(total_cumulative_recovered_cases(date='01-11-2021')$date)) == 1 && 
                '01-11-2021' %in% unique(total_cumulative_recovered_cases(date='01-11-2021')$date))
  # add your function here
})

test_that("Function returns error with invalid location argument", {
  expect_error(loc_format_check('CAN'))
  expect_error(loc_format_check('123'))
})

test_that("Function returns error with invalid date argument", {
  expect_error(date_format_check('not-a-date'))
  expect_error(date_format_check('123-456-789'))
})
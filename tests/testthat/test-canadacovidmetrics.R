test_that("Function returns a dataframe", {

  # total_cumulative_recovered_cases
  expect_true(is.data.frame(total_cumulative_recovered_cases()))
  # add your function here

  # total_cumulative_cases


  # total_cumulative_deaths


  # total_cumulative_vaccine_completion
  expect_true(is.data.frame(total_cumulative_cases()))

})

test_that("Function default args return non-empty dataframe", {
  expect_false(is.null(dim(total_cumulative_recovered_cases())))
  # add your function here

  # total_cumulative_cases


  # total_cumulative_deaths


  # total_cumulative_vaccine_completion
  expect_false(is.null(dim(total_cumulative_vaccine_completion())))

})

test_that("Function returns dataframe with correct columns", {
  expect_true(all(colnames(total_cumulative_recovered_cases()) == c("cumulative_recovered", "date_recovered", "province", "recovered")))
  # add your function here


  # total_cumulative_cases


  # total_cumulative_deaths


  # total_cumulative_vaccine_completion
  expect_true(all(colnames(total_cumulative_vaccine_completion()) == c("cases", "cumulative_cases", "date_report", "province")))
})

test_that("Function returns data filtered to specified date", {
  expect_true(length(unique(total_cumulative_recovered_cases(date='01-11-2021')$date)) == 1 &&
                '01-11-2021' %in% unique(total_cumulative_recovered_cases(date='01-11-2021')$date))
  # add your function here

  # total_cumulative_cases


  # total_cumulative_deaths


  # total_cumulative_vaccine_completion
  expect_true(length(unique(total_cumulative_vaccine_completion(date='01-11-2021')$date)) == 1 &&
                '01-11-2021' %in% unique(total_cumulative_vaccine_completion(date='01-11-2021')$date))

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


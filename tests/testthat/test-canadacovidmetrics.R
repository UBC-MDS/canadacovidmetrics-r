test_that("Function returns a dataframe", {

  # total_cumulative_recovered_cases
  expect_true(is.data.frame(total_cumulative_recovered_cases()))

  # total_cumulative_cases
  expect_true(is.data.frame(total_cumulative_cases()))

  # total_cumulative_deaths
  expect_true(is.data.frame(total_cumulative_deaths()))

  # total_cumulative_vaccine_completion
  expect_true(is.data.frame(total_cumulative_cases()))

})

test_that("Function default args return non-empty dataframe", {
  
  # total_cumulative_recovered_cases
  expect_false(is.null(dim(total_cumulative_recovered_cases())))

  # total_cumulative_cases
  expect_false(is.null(dim(total_cumulative_cases())))

  # total_cumulative_deaths
  expect_false(is.null(dim(total_cumulative_deaths())))

  # total_cumulative_vaccine_completion
  expect_false(is.null(dim(total_cumulative_vaccine_completion())))

})

test_that("Function returns dataframe with correct columns", {
    
  # total_cumulative_recovered_cases
  expect_true(all(colnames(total_cumulative_recovered_cases()) == c("cumulative_recovered", "date_recovered", "province", "recovered")))

  # total_cumulative_cases
  expect_true(all(colnames(total_cumulative_cases()) == c("cases", "cumulative_cases", "date_report", "province")))

  # total_cumulative_deaths
  expect_true(all(colnames(total_cumulative_deaths()) == c("cumulative_deaths", "date_death_report", "deaths", "province")))

  # total_cumulative_vaccine_completion
  expect_true(all(colnames(total_cumulative_vaccine_completion()) == c("cumulative_cvaccine", "cvaccine", "date_vaccine_completed", "province")))
})

test_that("Function returns data filtered to specified date", {
    
  # total_cumulative_recovered_cases
  expect_true(length(unique(total_cumulative_recovered_cases(date='01-11-2021')$date, datetime_type=FALSE)) == 1 &&
                '01-11-2021' %in% unique(total_cumulative_recovered_cases(date='01-11-2021', datetime_type=FALSE)$date))

  # total_cumulative_cases
  expect_true(length(unique(total_cumulative_cases(date='01-11-2021', datetime_type=FALSE)$date)) == 1 &&
                '01-11-2021' %in% unique(total_cumulative_cases(date='01-11-2021', datetime_type=FALSE)$date))

  # total_cumulative_deaths
  expect_true(length(unique(total_cumulative_deaths(date='01-11-2021', datetime_type=FALSE)$date)) == 1 &&
                '01-11-2021' %in% unique(total_cumulative_deaths(date='01-11-2021', datetime_type=FALSE)$date))

  # total_cumulative_vaccine_completion
  expect_true(length(unique(total_cumulative_vaccine_completion(date='01-11-2021', datetime_type=FALSE)$date)) == 1 &&
                '01-11-2021' %in% unique(total_cumulative_vaccine_completion(date='01-11-2021', datetime_type=FALSE)$date))

})
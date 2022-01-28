library(httr)
library(jsonlite)
library(testthat)

test_that("Function returns a dataframe", {

  # get_recoveries
  expect_true(is.data.frame(get_recoveries()))

  # get_cases
  expect_true(is.data.frame(get_cases()))

  # get_deaths
  expect_true(is.data.frame(get_deaths()))

  # get_vaccinations
  expect_true(is.data.frame(get_cases()))

})

test_that("Function default args return non-empty dataframe", {
  
  # get_recoveries
  expect_false(is.null(dim(get_recoveries())))

  # get_cases
  expect_false(is.null(dim(get_cases())))

  # get_deaths
  expect_false(is.null(dim(get_deaths())))

  # get_vaccinations
  expect_false(is.null(dim(get_vaccinations())))

})

test_that("Function returns dataframe with correct columns", {
    
  # get_recoveries
  expect_true(all(colnames(get_recoveries()) == c("cumulative_recovered", "date", "province", "recovered")))

  # get_cases
  expect_true(all(colnames(get_cases()) == c("cases", "cumulative_cases", "date", "province")))

  # get_deaths
  expect_true(all(colnames(get_deaths()) == c("cumulative_deaths", "date", "deaths", "province")))

  # get_vaccinations
  expect_true(all(colnames(get_vaccinations()) == c("cumulative_cvaccine", "cvaccine", "date", "province")))
})

test_that("Function returns data filtered to specified date", {
    
  # get_recoveries
  expect_true(length(unique(get_recoveries(date='01-11-2021')$date, datetime_type=FALSE)) == 1 &&
                '01-11-2021' %in% unique(get_recoveries(date='01-11-2021', datetime_type=FALSE)$date))

  # get_cases
  expect_true(length(unique(get_cases(date='01-11-2021', datetime_type=FALSE)$date)) == 1 &&
                '01-11-2021' %in% unique(get_cases(date='01-11-2021', datetime_type=FALSE)$date))

  # get_deaths
  expect_true(length(unique(get_deaths(date='01-11-2021', datetime_type=FALSE)$date)) == 1 &&
                '01-11-2021' %in% unique(get_deaths(date='01-11-2021', datetime_type=FALSE)$date))

  # get_vaccinations
  expect_true(length(unique(get_vaccinations(date='01-11-2021', datetime_type=FALSE)$date)) == 1 &&
                '01-11-2021' %in% unique(get_vaccinations(date='01-11-2021', datetime_type=FALSE)$date))

})
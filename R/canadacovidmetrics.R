library(tidyverse)
library(httr)
library(jsonlite)

#' Query total cumulative cases with ability to specify
#' location and date range of returned data.
#'
#' @param loc string: Specify geographic filter and aggregation of returned data.
#' Valid loc arguments are: 'canada', 'prov' and two-letter
#' province codes (e.g. 'ON', 'BC', etc.)
#' @param date string: If not None, return data from the specified date YYYY-MM-DD.
#' Superceeds 'after' and 'before' parameters.
#' @param after string: Return data on and after the specified date YYYY-MM-DD.
#' @param before string: Return data on and before the specified date YYYY-MM-DD.
#' @param datetime_type boolean: Return date column as a character (FALSE) or as a Date (TRUE).
#'
#' @return Dataframe containing content of API response.
#' @export
#'
#' @examples
#' total_cumulative_cases(loc = "ON", before = "2021-12-31")
#' total_cumulative_cases(loc = "prov", date = "2021-09-01")

total_cumulative_cases <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date(), datetime_type=TRUE){

  #' Check province/location format is compatible with API call
  format_loc <- c('canada', 'prov', 'BC', 'AB', 'SK', 'MB', 'ON', 'QC', 'NL', 'NB', 'NS', 'PE', 'NT', 'YT', 'NU', 'RP')
  if (!loc %in% format_loc){
    stop("Value passed for loc argument is not recognized. Must be one of: 'prov', 'canada', or a two-letter capitalized province code")
  }
    
  #' Check date format is compatible with API call
  if (!is.null(date)) {  
      date_fmt <- tryCatch(!is.na(as.Date(date, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
      if (!date_fmt){
          stop("Date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
      }
  }

  #' Check after date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(after, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("After date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  #' Check before date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(before, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("Before date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  if (!is.null(date)) {
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=cases&loc=%s&date=%s", loc, date)
  } else {
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=cases&loc=%s&after=%s&before=%s", loc, after, before)
  }
  
  raw_json <- GET(url)
  json_string <- content(raw_json, as="text")
  df <- fromJSON(json_string)$cases

  if(datetime_type){
    df$date_report = as.Date(df$date_report, format = "%d-%m-%y")
  }
    
  return(df)
}


#' Query total cumulative deaths with ability to specify
#' location and date range of returned data.
#'
#' @param loc string: Specify geographic filter and aggregation of returned data.
#' Valid loc arguments are: 'canada', 'prov' and two-letter
#' province codes (e.g. 'ON', 'BC', etc.)
#' @param date string: If not None, return data from the specified date YYYY-MM-DD.
#' Superceeds 'after' and 'before' parameters.
#' @param after string: Return data on and after the specified date YYYY-MM-DD.
#' @param before string: Return data on and before the specified date YYYY-MM-DD.
#' @param datetime_type boolean: Return date column as a character (FALSE) or as a Date (TRUE).
#'
#' @return Dataframe containing content of API response.
#' @export
#'
#' @examples
#' total_cumulative_deaths(loc = "ON", before = "2021-12-31")
#' total_cumulative_deaths(loc = "prov", date = "2021-09-01")

total_cumulative_deaths <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date(), datetime_type=TRUE){
  
  #' Check province/location format is compatible with API call
  format_loc <- c('canada', 'prov', 'BC', 'AB', 'SK', 'MB', 'ON', 'QC', 'NL', 'NB', 'NS', 'PE', 'NT', 'YT', 'NU', 'RP')
  if (!loc %in% format_loc){
    stop("Value passed for loc argument is not recognized. Must be one of: 'prov', 'canada', or a two-letter capitalized province code")
  }
    
  #' Check date format is compatible with API call
  if (!is.null(date)) {  
      date_fmt <- tryCatch(!is.na(as.Date(date, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
      if (!date_fmt){
          stop("Date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
      }
  }

  #' Check after date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(after, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("After date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  #' Check before date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(before, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("Before date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  if (!is.null(date)) {
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=mortality&loc=%s&date=%s", loc, date)
  } else {
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=mortality&loc=%s&after=%s&before=%s", loc, after, before)
  }
  
  raw_json <- GET(url)
  json_string <- content(raw_json, as="text")
  df <- fromJSON(json_string)$mortality

  if(datetime_type){
    df$date_death_report = as.Date(df$date_death_report, format = "%d-%m-%y")
  }
    
  return(df)
}


#' Query total cumulative recovered cases with ability to specify
#' location and date range of returned data.
#'
#' @param loc string: Specify geographic filter and aggregation of returned data.
#' Valid loc arguments are: 'canada', 'prov' and two-letter
#' province codes (e.g. 'ON', 'BC', etc.)
#' @param date string: If not None, return data from the specified date YYYY-MM-DD.
#' Superceeds 'after' and 'before' parameters.
#' @param after string: Return data on and after the specified date YYYY-MM-DD.
#' @param before string: Return data on and before the specified date YYYY-MM-DD.
#' @param datetime_type boolean: Return date column as a character (FALSE) or as a Date (TRUE).
#'
#' @return Dataframe containing content of API response.
#' @export
#'
#' @examples
#' total_cumulative_recovered_cases(loc = "ON", before = "2021-12-31")
#' total_cumulative_recovered_cases(loc = "prov", date = "2021-09-01")
total_cumulative_recovered_cases <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date(), datetime_type=TRUE){

  #' Check province/location format is compatible with API call
  format_loc <- c('canada', 'prov', 'BC', 'AB', 'SK', 'MB', 'ON', 'QC', 'NL', 'NB', 'NS', 'PE', 'NT', 'YT', 'NU', 'RP')
  if (!loc %in% format_loc){
    stop("Value passed for loc argument is not recognized. Must be one of: 'prov', 'canada', or a two-letter capitalized province code")
  }
    
  #' Check date format is compatible with API call
  if (!is.null(date)) {  
      date_fmt <- tryCatch(!is.na(as.Date(date, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
      if (!date_fmt){
          stop("Date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
      }
  }

  #' Check after date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(after, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("After date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  #' Check before date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(before, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("Before date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  if (!is.null(date)) {
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=recovered&loc=%s&date=%s", loc, date)
  } else {
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=recovered&loc=%s&after=%s&before=%s", loc, after, before)
  }
  
  raw_json <- GET(url)
  json_string <- content(raw_json, as="text")
  df <- fromJSON(json_string)$recovered
  
  if(datetime_type){
    df$date_recovered = as.Date(df$date_recovered, format = "%d-%m-%y")
  }
    
  return(df)
}

#' Query total cumulative vaccine completion with ability to specify
#' location and date range of returned data.
#'
#' @param loc string: Specify geographic filter and aggregation of returned data.
#' Valid loc arguments are: 'canada', 'prov' and two-letter
#' province codes (e.g. 'ON', 'BC', etc.)
#' @param date string: If not None, return data from the specified date YYYY-MM-DD.
#' Superceeds 'after' and 'before' parameters.
#' @param after string: Return data on and after the specified date YYYY-MM-DD.
#' @param before string: Return data on and before the specified date YYYY-MM-DD.
#' @param datetime_type boolean: Return date column as a character (FALSE) or as a Date (TRUE).
#'
#' @return Dataframe containing content of API response.
#' @export
#'
#' @examples
#' total_cumulative_vaccine_completion(loc = "ON", before = "2021-12-31")
#' total_cumulative_vaccine_completion(loc = "prov", date = "2021-09-01")
total_cumulative_vaccine_completion <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date(), datetime_type=TRUE){

  #' Check province/location format is compatible with API call
  format_loc <- c('canada', 'prov', 'BC', 'AB', 'SK', 'MB', 'ON', 'QC', 'NL', 'NB', 'NS', 'PE', 'NT', 'YT', 'NU', 'RP')
  if (!loc %in% format_loc){
    stop("Value passed for loc argument is not recognized. Must be one of: 'prov', 'canada', or a two-letter capitalized province code")
  }
    
  #' Check date format is compatible with API call
  if (!is.null(date)) {  
      date_fmt <- tryCatch(!is.na(as.Date(date, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
      if (!date_fmt){
          stop("Date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
      }
  }

  #' Check after date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(after, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("After date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
    
  #' Check before date format is compatible with API call
  date_fmt <- tryCatch(!is.na(as.Date(before, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("Before date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }

  if(!is.null(date)){
    url <- paste0('https://api.opencovid.ca/timeseries?stat=cvaccine&loc=', loc , '&date=', date)
  }else{
    url <- paste0('https://api.opencovid.ca/timeseries?stat=cvaccine&loc=', loc , '&after=', after, '&before=', before)
  }

  # Get Json Object
  jsonData <- GET(url)
  json_body <- rawToChar(jsonData$content)
  df <- fromJSON(json_body)$cvaccine

  if(datetime_type){
    df$date_vaccine_completed = as.Date(df$date_vaccine_completed, format = "%d-%m-%y")
  }

  return(df)

}



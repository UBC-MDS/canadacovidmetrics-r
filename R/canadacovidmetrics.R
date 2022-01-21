#' Check date format is compatible with API call
#'
#' @param datestr Date string to be checked
#'
#' @return None
#' @export 
#'
#' @examples
#' date_format_check("2021-12-31")
#' date_format_check("31-12-2021")
date_format_check <- function(datestr){}


#' Check province/location format is compatible with API call
#'
#' @param locstr Location string to be checked
#'
#' @return None
#' @export 
#'
#' @examples
#' loc_format_check("prov")
#' loc_format_check("ON")
loc_format_check <- function(locstr) {}


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
#'
#' @return Dataframe containing content of API response.
#' @export 
#'
#' @examples
#' total_cumulative_cases(loc = "ON", before = "2021-12-31")
#' total_cumulative_cases(loc = "prov", date = "2021-09-01")
total_cumulative_cases <- function(loc='prov', date=None, after='2020-01-01', before=today){}


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
#'
#' @return Dataframe containing content of API response.
#' @export 
#'
#' @examples
#' total_cumulative_deaths(loc = "ON", before = "2021-12-31")
#' total_cumulative_deaths(loc = "prov", date = "2021-09-01")
total_cumulative_deaths <- function(loc='prov', date=None, after='2020-01-01', before=today){}


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
#'
#' @return Dataframe containing content of API response.
#' @export 
#'
#' @examples
#' total_cumulative_recovered_cases(loc = "ON", before = "2021-12-31")
#' total_cumulative_recovered_cases(loc = "prov", date = "2021-09-01")
total_cumulative_recovered_cases <- function(loc='prov', date=None, after='2020-01-01', before=today){}


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
#'
#' @return Dataframe containing content of API response.
#' @export 
#'
#' @examples
#' total_cumulative_vaccine_completion(loc = "ON", before = "2021-12-31")
#' total_cumulative_vaccine_completion(loc = "prov", date = "2021-09-01")
total_cumulative_vaccine_completion <- function(loc='prov', date=None, after='2020-01-01', before=today){}
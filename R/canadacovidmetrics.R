
# 'Sample Usage of request library
# request is built on httr and can be used to create requests to download data from the web
# We can auto execute 'request' with pipes.
# Build api route as follows
# api('https://api.github.com/') %>% http()
# or make HTTPS request as follows
# 'https://api.github.com/' %>% api()
# api("http://api.plos.org/search") %>%
# api_query(q = ecology, wt = json, fl = 'id,journal') %>%
# peep
#

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
date_format_check <- function(datestr){
  date_fmt <- tryCatch(!is.na(as.Date(datestr, tryFormats = c("%Y-%m-%d", "%d-%m-%Y"))), error = function(err) {FALSE})
  if (!date_fmt){
    stop("Date format is not acceptable. Must be one of 'yyyy-mm-dd or dd-mm-yyyy'")
  }
}


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
loc_format_check <- function(locstr) {
  format_loc <- c('canada', 'prov', 'BC', 'AB', 'SK', 'MB', 'ON', 'QC', 'NL', 'NB', 'NS', 'PE', 'NT', 'YT', 'NU', 'RP')
  if (!locstr %in% format_loc){
    stop("Value passed for loc argument is not recognized. Must be one of: 'prov', 'canada', or a two-letter capitalized province code")
  }
}


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

total_cumulative_cases <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date()){}




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

total_cumulative_deaths <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date()){}

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
total_cumulative_recovered_cases <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date()){
  
  loc_format_check(loc)
  
  if (!is.null(date)) {
    date_format_check(date)
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=recovered&loc=%s&date=%s", loc, date)
  } else {
    date_format_check(after)
    date_format_check(before)
    url <- sprintf("https://api.opencovid.ca/timeseries?stat=recovered&loc=%s&after=%s&before=%s", loc, after, before)
  }
  
  raw_json <- GET(url)
  json_string <- content(raw_json, as="text")
  df <- fromJSON(json_string)$recovered
  
  invisible(df)
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
total_cumulative_vaccine_completion <- function(loc='prov', date=NULL, after='2020-01-01', before=Sys.Date(), datetime_type=FALSE){

  loc_format_check(loc)  # check location is valid

  if(date != NULL){
    date_format_check(date)  # check date is valid
    url = paste0('https://api.opencovid.ca/timeseries?stat=cvaccine&loc=', loc , '&date=', date)
  }else{

    date_format_check(before)  # check before-date is valid
    date_format_check(after)  # check after-date is valid
    url = paste0('https://api.opencovid.ca/timeseries?stat=cvaccine&loc=', loc , '&after=', after, '&before=', before)
  }

  # Get Json Object
  jsonData = GET(url)
  json_body = rawToChar(jsonData$content)
  df = fromJSON(json_body)$cvaccine

  if(datetime_type){
    df$date_vaccine_completed = as.Date(df$date_vaccine_completed, format = "%d-%m-%y")
  }

  return df

}



#' Get Historical Market Data
#'
#' This function retrieves historical market data for a specific symbol using the provided API key.
#'
#' @param symbol A character vector of the symbol for which to retrieve historical data
#' @param api.key The API key for authentication and authorization
#' @param start_date The start date for the historical data (default is 30 days ago)
#' @param end_date The end date for the historical data (default is the current date)
#' @param period The period for the historical data (default is 'day')
#'
#' @return A parsed content of the response containing the historical market data
#' @export
#'
#' @examples
#' symbol <- "AAPL"
#' api.key <- "your_api_key"
#' start_date <- "2023-01-01"
#' end_date <- "2023-02-01"
#' period <- "day"
#' #historical_data <- getHistory(symbol, api.key, start_date, end_date, period)
#' #getHistory('AAPL',apikey)


getHistory = function(symbol,api.key,start_date=Sys.Date()-30,end_date=Sys.Date(),period='day')
{
  start_date = as.numeric(as.POSIXct(start_date, format="%Y-%m-%d"))
  end_date = as.numeric(as.POSIXct(end_date, format="%Y-%m-%d"))
  url = paste0('https://api.lime.co/marketdata/history?symbol=',symbol,'&period=',period,'&from=',start_date,'&to=',end_date)
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  res = content(res, "parsed")
  return(rbindlist(res))
}

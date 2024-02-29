#' Option Series Lookup
#'
#' This function retrieves option series for a specific symbol using the provided API key.
#'
#' @param symbol A character vector representing the symbol for which to retrieve option series
#' @param api.key The API key for authentication and authorization
#'
#' @return A parsed content of the response containing the option series information
#' @export
#'
#' @examples
#' symbol <- "AAPL"
#' api.key <- "your_api_key"
#' #option_series <- optionSeries(symbol, api.key)
#' #optionSeries('AAPL',apikey)
#'

optionSeries = function(symbol,api.key)
{
  url = paste0('https://api.lime.co/securities/',symbol,'/options/series')
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  res = content(res, "parsed")
  return(rbindlist(res))
}

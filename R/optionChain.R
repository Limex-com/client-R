#' Option Chain Lookup
#'
#' This function retrieves an option chain for a specific symbol and series (expiration) using the provided API key.
#'
#' @param symbol A character vector representing the symbol for which to retrieve the option chain
#' @param series A character vector representing the option series (expiration) for which to retrieve the chain
#' @param api.key The API key for authentication and authorization
#'
#' @return A parsed content of the response containing the option chain information
#' @export
#'
#' @examples
#' symbol <- "AAPL"
#' series <- "2023-08-25"
#' api.key <- "your_api_key"
#' #option_chain <- optionChain(symbol, series, api.key)
#' #optionChain('AAPL','2023-09-01',apikey)

optionChain = function(symbol,series,api.key)
{
  url = paste0('https://api.lime.co/securities/',symbol,'/options?expiration=',series)
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  res = content(res, "text")
  return(parse_json(res,simplifyVector=TRUE))
}

#' Get Quote for Symbols
#'
#' This function retrieves quotes for multiple symbols using the provided API key.
#'
#' @param symbol A character vector of symbols for which to retrieve quotes
#' @param api.key The API key for authentication and authorization
#'
#' @return A parsed content of the response containing the quotes for the provided symbols
#' @export
#'
#' @examples
#' symbols <- c("AAPL", "MSFT")
#' api.key <- "your_api_key"
#' #quotes <- getQuote(symbols, api.key)
#' #getQuote('NVDA',apikey)
#'

getQuote = function(symbol,api.key)
{
  url = 'https://api.lime.co/marketdata/quotes'
  headers = c( Authorization = paste0('Bearer ',api.key))
  body = paste0('["',paste0(symbol,collapse = '","'),'"]')
  res = POST(url,body=body,add_headers(headers))
  res = content(res, "parsed")
  return(rbindlist(res))
}



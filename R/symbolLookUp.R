#' Symbol Look-Up
#'
#' This function performs a symbol look-up using the provided API key and symbol query.
#'
#' @param symbol A character vector representing the symbol to look up
#' @param api.key The API key for authentication and authorization
#' @param limit The maximum number of results to return (default is 5)
#'
#' @return A parsed content of the response containing the symbol look-up results
#' @export
#'
#' @examples
#' symbol <- "AAPL"
#' api.key <- "your_api_key"
#' limit <- 10
#' #symbol_results <- symbolLookUp(symbol, api.key, limit)
#' #symbolLookUp('AAPL',api.key=apikey)

symbolLookUp = function(symbol,api.key,limit=5)
{
  url = 'https://api.lime.co/securities'
  headers = c( Authorization = paste0('Bearer ',api.key))
  params = list(query=symbol,limit=limit)
  res = GET(url,add_headers(headers),query=params)
  res = content(res, "parsed")
  return(rbindlist(res[[2]]))
}

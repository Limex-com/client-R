#' Get Account Trades
#'
#' This function retrieves account trades using the provided account ID and API key.
#'
#' @param account The account ID for which to retrieve trades
#' @param api.key The API key for authentication and authorization
#' @param date The date for which to retrieve trades (default is current date)
#' @param limit The maximum number of trades to retrieve (default is 10)
#' @param skip The number of trades to skip (default is 0)
#'
#' @return A data frame containing account trades
#' @export
#'
#' @examples
#' account <- "your_account_id"
#' api.key <- "your_api_key"
#' #trades <- getTrades(account, api.key)
#' #getTrades('dmo00374@demo',apikey)
#' #getTrades('dmo00374@demo',apikey,date=Sys.Date()-2,limit=2,skip=30)
#'

getTrades = function(account,api.key,date=Sys.Date(),limit=10,skip=0)
{
  url = paste0('https://api.lime.co/accounts/',account,'/trades/',date)
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers),query = list(limit=limit,skip=skip))
  res = content(res, "parsed")
  return(rbindlist(res$trades))
}

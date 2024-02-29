#' Get Account Positions
#'
#' This function retrieves account positions using the provided account ID and API key.
#'
#' @param account The account ID for which to retrieve positions
#' @param api.key The API key for authentication and authorization
#' @param date The date for which to retrieve positions (default is current date)
#'
#' @return A data frame containing account positions
#' @export
#'
#' @examples
#' account <- "your_account_id"
#' api.key <- "your_api_key"
#' #positions <- getPositions(account, api.key)
#' #getPositions('dmo00374@demo',apikey)
#' #getPositions('dmo00374@demo',apikey,date=Sys.Date()-4)
#'

getPositions = function(account,api.key,date=Sys.Date())
{

  url = paste0('https://api.lime.co/accounts/',account,'/positions')
  headers = c( Authorization = paste0('Bearer ',api.key))
  params = list()
  if(date!=Sys.Date()) params = list(date=date)
  res = GET(url,add_headers(headers),query=params)
  res = content(res, "parsed")
  return(rbindlist(res))
}

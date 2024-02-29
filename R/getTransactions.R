#' Get Account Transactions
#'
#' This function retrieves account transactions using the provided account ID and API key.
#'
#' @param account The account ID for which to retrieve transactions
#' @param api.key The API key for authentication and authorization
#' @param start_date The start date for retrieving transactions (default is current date)
#' @param end_date The end date for retrieving transactions (default is current date)
#' @param limit The maximum number of transactions to retrieve (default is 10)
#' @param skip The number of transactions to skip (default is 0)
#'
#' @return A list of parsed JSON containing account transactions
#' @export
#'
#' @examples
#' account <- "your_account_id"
#' api.key <- "your_api_key"
#' #transactions <- getTransactions(account, api.key)
#' #getTransactions('dmo00374@demo',apikey)
#' #getTransactions('dmo00374@demo',apikey,limit=25,skip=0,end_date='2023-08-22')
#'

getTransactions = function(account,api.key,start_date=Sys.Date(),end_date=Sys.Date(),limit=10,skip=0)
{
  url = paste0('https://api.lime.co/accounts/',account,'/transactions')
  headers = c( Authorization = paste0('Bearer ',api.key))
  # params
  params = list(limit=limit,skip=skip)
  if(start_date!=Sys.Date()) params = c(params, start_date = start_date)
  if(end_date!=Sys.Date()) params = c(params, end_date = end_date)
  res = GET(url,add_headers(headers),query = params)
  res = content(res, "text")
  return(parse_json(res,simplifyVector=TRUE))
}



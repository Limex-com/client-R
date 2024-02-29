#' Get Active Orders
#'
#' This function retrieves active orders for the provided account using the provided API key.
#'
#' @param account The account ID for which to retrieve active orders
#' @param api.key The API key for authentication and authorization
#'
#' @return A parsed content of the response containing the active orders for the account
#' @export
#'
#' @examples
#' account <- "your_account_id"
#' api.key <- "your_api_key"
#' active_orders <- getOrders(account, api.key)
#' #getOrders('dmo00374@demo',apikey)
#'


getOrders = function(account,api.key)
{
  url = paste0('https://api.lime.co/accounts/',account,'/activeorders')
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  return(content(res, "parsed"))
}


#' Get Account Information
#'
#' This function retrieves account information using the provided API key.
#'
#' @param api.key The API key for authentication and authorization
#'
#' @return A data frame containing account information
#' @export
#'
#' @examples
#' api.key <- "your_api_key"
#' #account_info <- getAccount(api.key)
#'
#' @import httr
#' @import jsonlite
#' @import data.table


getAccount = function(api.key)
{
  url = 'https://api.lime.co/accounts'
  headers = c(Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  res = content(res, "parsed")
  res = rbindlist(res)
  return(res)
}

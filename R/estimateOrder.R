#' Estimate Order Fees
#'
#' This function allows you to estimate order fees using the provided account ID and API key.
#'
#' @param account The account ID for which to estimate order fees
#' @param api.key The API key for authentication and authorization
#' @param symbol The trading symbol of the instrument for which to estimate fees
#' @param quantity The quantity of the instrument for which to estimate fees
#' @param side The side of the order, either 'buy' or 'sell'
#' @param price The price at which to estimate fees (default is 0)
#'
#' @return A parsed content of the response indicating the estimated order fees
#' @export
#'
#' @examples
#' account <- "your_account_id"
#' api.key <- "your_api_key"
#' symbol <- "AAPL"
#' quantity <- 10
#' side <- "buy"
#' #fee_estimation <- estimateOrder(account, api.key, symbol, quantity, side)


estimateOrder = function(account,api.key,symbol,quantity,side,price=0)
{
  url = 'https://api.lime.co/pricing/fees'
  body <- list(account_number = account,
               symbol = symbol,
               quantity = quantity,
               side = side,
               price = price)
  headers = c(Authorization = paste0('Bearer ',api.key))
  res = POST(url,body = body,add_headers(headers),encode = 'json')
  return(content(res, "parsed"))
}

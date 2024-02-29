#' Place an Order
#'
#' This function allows you to place an order using the provided account ID and API key.
#'
#' @param account The account ID for which to place the order
#' @param api.key The API key for authentication and authorization
#' @param symbol The trading symbol of the instrument to trade
#' @param quantity The quantity of the instrument to trade
#' @param price The price at which to place the order (default is 0)
#' @param stop_price The stop price for stop orders (default is 0)
#' @param time_in_force The time in force for the order (default is 'day')
#' @param order_type The order type (default is 'market')
#' @param side The side of the order, either 'buy' or 'sell' (default is 'buy')
#' @param comment Additional comment or note for the order (default is '')
#' @param exchange The exchange to place the order on (default is 'Auto')
#'
#' @return A parsed content of the response indicating the success of the order placement
#' @export
#'
#' @examples
#' account <- "your_account_id"
#' api.key <- "your_api_key"
#' symbol <- "AAPL"
#' quantity <- 10
#' #order_response <- placeOrder(account, api.key, symbol, quantity)


placeOrder = function(account,api.key,symbol,quantity,
                      price=0,
                      stop_price=0,
                      time_in_force = 'day',
                      order_type = 'market',
                      side='buy',
                      comment='',
                      exchange='Auto')
  {
  url = 'https://api.lime.co/orders/place'
  body <- list(account_number = account,
               symbol = symbol,
               quantity = quantity,
               price = price,
               stop_price=stop_price,
               time_in_force = time_in_force,
               order_type = order_type,
               side = side,
               comment = comment,
               exchange=exchange)
  headers = c(Authorization = paste0('Bearer ',api.key))
  res = POST(url,body = body,add_headers(headers),encode = 'json')
  return(content(res, "parsed"))
  }

#' Cancel an Order
#'
#' This function allows you to cancel a specific order using the provided API key and order ID.
#'
#' @param api.key The API key for authentication and authorization
#' @param order_id The ID of the order to be canceled
#'
#' @return A parsed content of the response indicating the success of the order cancellation
#' @export
#'
#' @examples
#' api.key <- "your_api_key"
#' order_id <- "your_order_id"
#' #cancellation_response <- cancelOrder(api.key, order_id)
#'



cancelOrder = function(api.key,order_id)
{
  url = paste0('https://api.lime.co/orders/',order_id,'/cancel')
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = POST(url,add_headers(headers))
  return(content(res, "parsed"))
}


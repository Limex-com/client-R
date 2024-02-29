#' Get Order Status
#'
#' This function retrieves the status of a specific order using the provided API key and order ID.
#'
#' @param api.key The API key for authentication and authorization
#' @param order_id The ID of the order for which to retrieve the status
#'
#' @return A parsed content of the response indicating the status of the order
#' @export
#'
#' @examples
#' api.key <- "your_api_key"
#' order_id <- "your_order_id"
#' order_status <- getOrderStatus(api.key, order_id)
#' #getOrderStatus(apikey,234684792874)
#'



getOrderStatus = function(api.key,order_id)
{
  url = paste0('https://api.lime.co/orders/',order_id)
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  return(content(res, "parsed"))
}

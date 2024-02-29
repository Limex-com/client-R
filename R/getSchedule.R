#' Get Market Schedule
#'
#' This function retrieves the market schedule using the provided API key.
#'
#' @param api.key The API key for authentication and authorization
#'
#' @return A parsed content of the response containing the market schedule
#' @export
#'
#' @examples
#' api.key <- "your_api_key"
#' #schedule <- getSchedule(api.key)
#'

getSchedule= function(api.key)
{

  url = 'https://api.lime.co/marketdata/schedule'
  headers = c( Authorization = paste0('Bearer ',api.key))
  res = GET(url,add_headers(headers))
  return(content(res, "parsed"))
}

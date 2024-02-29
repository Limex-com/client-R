#' Get Access Token
#'
#' This function retrieves an access token from Lime's authentication server
#'
#' @param client_id The client ID provided by Lime
#' @param client_secret The client secret provided by Lime
#' @param username Your Lime account username
#' @param password Your Lime account password
#'
#' @return The access token required for accessing Lime APIs
#' @export
#'
#' @examples
#' client_id <- "your_client_id"
#' client_secret <- "your_client_secret"
#' username <- "your_username"
#' password <- "your_password"
#' #access_token <- getToken(client_id, client_secret, username, password)
#'
#' @import httr
#' @import jsonlite
#' @import data.table

getToken = function(client_id,client_secret,username,password)
{
  body <- list(grant_type = 'password',
               client_id = client_id,
               client_secret = client_secret,
               username = username,
               password=password)
  url = 'https://auth.lime.co/connect/token'
  headers = (.headers = c('Content-Type' = 'application/x-www-form-urlencoded'))
  res = POST(url,body = body,header=headers,encode = 'form')
  return(content(res, "parsed")$access_token)
}

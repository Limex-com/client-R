

# devtools::install_github("arbuzovv/limeR")

library(limeR)


token <- getToken(client_id = "your_client_id",
                  client_secret = "your_client_secret",
                  username = "your_username",
                  password = "your_password")

# my temp token for this example
token = 'YmIyMDcwM2EtN2M4My00ODAxLWE3ZTEtNTNhMTQyMGI2MGM0fDIwMjMwODI5MDk1ODIzfHRyYWRpbmctYXBwLWRtbzAwMzc0fHw'

# Retrieve account information
account_info <- getAccount(token)
trade_symbol = symbolLookUp('Apple', token)$symbol[1]


historical_data <- getHistory(symbol = trade_symbol, api.key = token,
                              start_date = Sys.Date()-21,end_date = Sys.Date(),
                              period = "day")
mean_history_price = mean(historical_data$close)



if(getSchedule(token)$session != "closed")
{

# last price for our limit order
quote_data <- getQuote(symbol = "AAPL", api.key = token)

signal = ifelse(quote_data$week52_high*0.95>mean_history_price,1,-1)

position_size_money = account_info$margin_buying_power*0.02
position_size = round(position_size_money/quote_data$last)

my_portfolio = getPositions(account_info$account_number, token)
order_size = signal*position_size-my_portfolio[symbol==trade_symbol]$quantity
side = ifelse(order_size>0,'buy','sell')

order_result <- placeOrder(account = account_info$account_number,
                           api.key = token,
                           symbol = trade_symbol,
                           quantity = position_size,
                           order_type = "limit",
                           price = quote_data$last,
                           side = side)
}







api.key = getToken('trading-app-dmo00374','e4f10bc1a0b34a89befd381f2eb0928a','dbaygozin+203@corp.finam.ru','ZCAkjesZf4')
apikey


bearer = getToken('trading-app-dmo00374','e4f10bc1a0b34a89befd381f2eb0928a','dbaygozin+203@corp.finam.ru','ZCAkjesZf4')



account_info <- getAccount(api.key)

symbols <- c("AAPL", "MSFT",'AMZN','NVDA','TSLA','BAC','TSLA','XOM','NIO','AMD','RIOT','BA')
result = data.table()
for(i in 1:10)
{
  start = Sys.time()
  order_status <- getOrderStatus(api.key, 25163352092)
  #option_series <- optionSeries(symbols[i], api.key)
  #option_chain <- optionChain(symbols[i], '2023-09-01', api.key)
  #positions <- getPositions('dmo00374@demo', api.key)
  #symbol_results <- symbolLookUp(symbols[i], api.key, 5)
  end = Sys.time()
  result = rbind(result,end-start)
}
mean(result$x)


symbol <- "AAPL"
api.key <- "your_api_key"
limit <- 10



positions <- getPositions('dmo00374@demo', api.key)

option_series <- optionSeries('AMZN', api.key)


account <- "dmo00374@demo"
symbol <- "AAPL"
quantity <- 10
side <- "buy"

option_chain <- optionChain('NVDA', '2023-09-01', api.key)

getTransactions('dmo00374@demo',apikey,limit=25,skip=0,end_date='2023-08-22')



25163352093

while(1==1)
{
  if(format(Sys.time(), "%X") == '19:16:30')
  {
    order_result <- placeOrder(account = 'dmo00374@demo',
                               api.key = apikey,
                               symbol = 'AMZN',
                               quantity = 1,
                               order_type = "market",
                               side = 'buy')
    print('Sys.sleep')
    Sys.sleep(1)
  }
}

getOrders('dmo00374@demo', api.key)
getTrades('dmo00374@demo', api.key)
as.POSIXct(1693231771)


estimateOrder(account = 'dmo00374@demo',
              api.key = apikey,
              symbol = 'AAPL',
              quantity = 1,
              side = 'buy')

placeOrder(account = 'dmo00374@demo',
           api.key = bearer,
           symbol = 'TSLA',
           quantity = 3,
           order_type = "market",
           side = 'buy',comment = 'my new order blablabla')









library(quantmod)

# get daily data
MSFT = getSymbols('MSFT')
# TSMC = getSymbols('2330.tw')

View(MSFT)

# financial chart
chartSeries(MSFT)

# monthly financial chart
chartSerries(to.monthly(MSFT))

# more args
chartSeries(to.monthly(MSFT), theme='white', up.col='red', dn.col='green')

# add other lines
addSMA()
addSMA(60)
addBBands()
addMACD()
addRSI()
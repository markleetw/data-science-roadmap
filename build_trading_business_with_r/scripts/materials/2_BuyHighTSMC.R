##Buy High and Sell Low
#install.packages("quantmod")

library(quantmod)
rm(list=ls())

STK=as.matrix(to.weekly(get(getSymbols("2330.tw"))))
profit=setNames(numeric(length(rownames(STK))), rownames(STK))	## profit vector

lastC=STK[1,4]	##Close Price of the 1th Week

for (m in rownames(STK)[-1]) {
	if(STK[m,1]<=lastC){profit[m]=STK[m,4]-STK[m,1]}
	if(STK[m,1]>lastC){profit[m]=STK[m,1]-STK[m,4]}
#if(STK[m,1]<=lastC){profit[m]=STK[m,4]-STK[m,1]}else(
#    profit[m]=STK[m,1]-STK[m,4])

lastC=STK[m,4]
}

head(cbind(STK[,c(1,4)],profit))	##Check

###performance module######
source('performance.R')
par(mfrow=c(1,2))
performance(profit)
ProfitBar(profit)

##fee
#install.packages("quantmod")
library(quantmod)


STK=as.matrix(to.weekly(get(getSymbols("2330.tw"))))
chartSeries(STK)
profit=setNames(numeric(length(rownames(STK))), rownames(STK))	## profit vector

lastC=STK[1,4]	##the Close of the 1th week

for (m in rownames(STK)[-1]) {
fee=STK[m,1]*0.004	##commision fee
#fee=0
	if(STK[m,1]<lastC){profit[m]=STK[m,4]-STK[m,1]-fee}
	if(STK[m,1]>lastC){profit[m]=STK[m,1]-STK[m,4]-fee}
lastC=STK[m,4]
}

head(cbind(STK[,c(1,4)],profit))	##check

plot(cumsum(profit),type="l",col="red",lwd=2)

###performance module######

source("performance.r")
par(mfrow=c(1,2))
performance(profit)
ProfitBar(profit)

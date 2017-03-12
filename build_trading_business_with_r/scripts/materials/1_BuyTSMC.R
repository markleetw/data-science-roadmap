#install.packages("quantmod")
library(quantmod)
rm(list=ls())

STK=get(getSymbols("2330.tw"))
STK=as.matrix(to.weekly(STK))

profit=setNames(numeric(length(rownames(STK))), rownames(STK))	## profit vector

for (m in rownames(STK)) {
	profit[m]=STK[m,4]-STK[m,1]
##	profit[m]=Cl(STK)[m]-Op(STK)[m]
##	profit[m]=Hi(STK)[m]-Op(STK)[m]
}

#head(cbind(STK[,c(1,4)],profit),10)

plot(cumsum(profit),type="l",col="red",lwd=2)
abline(h=0,col="green")

#source('performance.R')
#performance(profit)



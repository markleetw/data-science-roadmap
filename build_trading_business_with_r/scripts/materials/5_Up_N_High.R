##STOCK:0050
##Strategy:up m1 High buy, sell after m2 day

library(quantmod)
rm(list=ls())
STK=as.matrix(get(getSymbols("0050.tw")))

m1=10;m2=3
SL=0.8

profit=setNames(rep(0,length(rownames(STK))),rownames(STK))

for (m in (m1+1):(length(rownames(STK))-m2)){	

#if (sd(Cl(STK)[(m-m1):(m-1)])<0.5){			
fee=Cl(STK)[m]*0.004

	if (Cl(STK)[m]>max(Hi(STK)[(m-m1):(m-1)]) && 		## Today Close > m1 High
		Cl(STK)[(m-1)]<=max(Hi(STK)[(m-m1-1):(m-2)])){	##Last Close < m1 High
	profit[m]=Cl(STK)[m+m2]-Cl(STK)[m]-fee}	

	if (min(Lo(STK)[m:(m+m2)])<Cl(STK)[m]*SL){
	profit[m]=Cl(STK)[m]*(SL-1)-fee}	##StopLoss

}
#}

head(cbind(STK[,c(2,4)],profit),100)	##Check
#######
source("performance.R")
performance(profit)
	
### Fixed Fraction ###
### Input profit vector ##

source("7_TX_HL.R")

initM=1000000	## initial money
loss=5000	## the stop loss of the strategy
capital=initM	## current money
risk=0.02	## risk fraction 

PZ.FF=setNames(rep(1,length(profit)),names(profit))
PZ.FF[1]=floor(capital*risk/loss)

for (m in 2:length(profit)){
	PZ.FF[m]=floor(capital*risk/loss)
	capital=capital+PZ.FF[m]*profit[m]*200
}

head(cbind(profit,PZ.FF,"P&L"=profit*PZ.FF
,"Cap"=initM+cumsum(profit*PZ.FF*200)),1000)


### performance module ###
source("performance.R", encoding = 'BIG5',echo = FALSE)
par(mfcol=c(1,2))
performance(profit)
performance(profit*PZ.FF)



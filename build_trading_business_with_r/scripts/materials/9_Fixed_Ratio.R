### Fixed Fraction ###
### Input profit vector ##
rm(list=ls())
source("7_TX_HL.R")

initM=1000000	## initial money
capital=initM	## current money
delta=30000	## the stop loss of the strategy

PZ.FR=setNames(rep(1,length(profit)),names(profit))

for (m in 1:length(profit)){
  if (capital>=initM){
	PZ.FR[m]=floor((1+(1+8*(capital-initM)/delta)^0.5)/2)
	capital=capital+PZ.FR[m]*profit[m]*200
  }else{capital=capital+profit[m]*200}
}

head(cbind(profit,PZ.FR,"P&L"=profit*PZ.FR
,"Cap"=initM+cumsum(profit*PZ.FR*200)),1000)


### performance module ###
source("performance.R", encoding = 'BIG5',echo = FALSE)
par(mfcol=c(1,2))
performance(profit)
performance(profit*PZ.FR)



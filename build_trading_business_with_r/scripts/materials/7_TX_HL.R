##TX futures, long at Open+Th,dayTrade,no StopPtofit

currenttime=proc.time()	##current time

es=read.table("tx.txt",header=TRUE,sep=',',colClasses=c("NULL","character","character","integer"
,"integer","integer","integer","integer"))	## reading Data

es=split(es,factor(es$Date,levels=unique(es$Date),ordered=TRUE))	##Split Data

k1=0.55	##vol Par
t1=90		## Time limit
SL=20		#Stop Loss Points

profit=setNames(numeric(length(es)), names(es))		## profit vector
Cl=profit

vol=max(es[[1]]$High)-min(es[[1]]$Low)	##Vol in 1th day
Cl[1]=tail(es[[1]]$Close,1)

for (m in names(es)[-1]){
	esToday=es[[m]]
	Cl[m]=tail(esToday$Close,1)
	todayTime=unique(esToday$Time)	

###Long
	long=ceiling(esToday$Open[1]+(vol*k1))	

	i=1								
	while(esToday$High[i]<long && i<t1){i=i+1}  	##long at Open+Th before t1	
	
	if (esToday$High[i]>=long){j=i+1 			##long position                                             
    	
		while (esToday$Low[j]>long-SL && j<length(todayTime)){j=j+1} 	##check StopLoss
		if (j==length(todayTime)){profit[m]=esToday$Close[j]-long-5}			##Exit at Close
		if (esToday$Low[j]<=long-SL && j<length(todayTime)){profit[m]=-SL-5}		##StopLoss	
	}

vol=max(esToday$High)-min(esToday$Low)		##Today Vol
}

########Perofrmance module#######

(spttime=proc.time()-currenttime)

source("performance.R")
performance(profit)


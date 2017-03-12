PZ=setNames(rep(1,length(profit)),names(profit))

for (m in 2:length(profit)){
	if (sign(profit)[m-1]<0){PZ[m]=2*PZ[m-1]} else 
	if (sign(profit)[m-1]>0){PZ[m]=1} else 
	if (sign(profit)[m-1]==0){PZ[m]=PZ[m-1]}
}
head(cbind(profit,PZ,profit*PZ),10)

source("performance.R")

par(mfrow=c(1,3))
performance(profit)
performance(profit*PZ)
ProfitBar(PZ)
max(PZ)
mean(PZ)




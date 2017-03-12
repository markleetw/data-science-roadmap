##profit growth when bidding f##

nbet=40		## number of bidding
odds=2			## odds
pwin=0.5		## win rate
initM=100		## initial capital
f=0.3			## bidding fraction

capital=rep(initM,1)  		## current capital

for(i in 2:nbet){	## running each game
	dice=sample(0:1,size=1,prob=c(0.5,0.5),replace=T)			 ## gamble simulation
	capital[i]=dice*capital[i-1]*f*(1+odds)+capital[i-1]*(1-f)	## the growth of capital
}
 	
plot(capital,type="l",col="red",lwd=3,font=2
,xlab="The # of Bidding",ylab="The Growth of Capital"
,main=paste("WinRate",pwin*100,"%,","Odds",odds,", Play",nbet,"Games, "
,"Bidding",f*100,"%"))

abline(h=initM,col="green",lty=2,lwd=3)

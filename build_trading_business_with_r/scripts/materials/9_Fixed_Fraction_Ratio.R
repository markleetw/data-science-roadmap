###Fixed Fraction & Fiexed Ratio###

initM=1000000	## Initial money
loss=5000		## Stop loss of Strategy
delta=20000
Cap=seq(initM,15*initM,by=10000)
risk=0.02

Frac=setNames(numeric(length(Cap)),Cap)
Ratio=Frac

for (currM in Cap ){ ## momey growth
  Frac[[as.character(currM)]]=floor(currM*risk/loss)				# the formula of Fixed Fraction 
  Ratio[[as.character(currM)]]=floor((1+(1+8*(currM-initM)/delta)^0.5)/2)	# the formula of Fixed Ratio
}
x=ts(cbind(Frac,Ratio))
rownames(x)=as.character(Cap)
  
ts.plot(x,col=c("blue","red"),lwd=c(3,3)
        ,ylab="No. of Contracts",xlab="(W) Profit from 100W",xaxt = "n"
        ,main="Fixed Fraction (Blue) v.s. Fixed Ratio (Red)")

axis(1,seq(1,length(Frac),by=520),seq(initM,(72*initM),by=520*loss))



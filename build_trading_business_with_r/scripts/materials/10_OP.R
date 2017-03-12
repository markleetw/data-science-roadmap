STK=9100:9600
portfolio=rep(0,1)

#####
CallK=9350
CallPrice=54
Call=STK-CallK
Call[Call<0]=0
Call=Call-CallPrice
names(Call)=STK

portfolio=portfolio+(-Call)

#######
CallK=9450
CallPrice=13.5
Call=STK-CallK
Call[Call<0]=0
Call=Call-CallPrice
names(Call)=STK

portfolio=portfolio+(+Call)

###########
PutK=9350
PutPrice=29.5
Put=PutK-STK
Put[Put<0]=0
Put=Put-PutPrice
names(Put)=STK
portfolio=portfolio+(-Put)

#############

PutK=9250
PutPrice=7
Put=PutK-STK
Put[Put<0]=0
Put=Put-PutPrice
names(Put)=STK
portfolio=portfolio+(Put)

##############

plot(portfolio,type="l",col="red",lwd=2,font=2,xaxt = "n",ylab="PL")

axis(1,1:length(STK),as.character(STK),col="black")
abline(h=0,col="green",lwd=2)

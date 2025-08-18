x <- c(0,0,0,0,0)
j <- 1
for (i in 1:5){
  for (j in 1:20)
    {x[i]=x[i]+(exp(i)*log(j^2))}
}
print(x)

#while loop 
x=0; y =1
while(x+y<=6){x <- x+y}
print(x)

#repeat 
n=30; s=0; i=1
repeat{
  s=s+i; i=i+1
  if(n<i) break
}
print(s)
#P(X<=x)=alpha => x is the quantile and the alpha is the probability 
#probabilities 
dbinom(5,10,0.8)
dbinom(1:5,10,0.8)
sum(dbinom(0:10,10,0.8))
pnorm(1.2)
pnorm(seq(0,5,by=0.01),1.2)
qnorm(0.975)
rpois(10,4)
#generate the same seq 
set.seed(42)
rpois(10,4)
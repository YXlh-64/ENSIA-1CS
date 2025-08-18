#generating a random var following a poisson ditr 
#let's generate X follow P(lambda=2)

lambda=2 
i=0
u = runif(1)
y= (-1/lambda)*log(u)
sum =y 
while(sum<1){ #here t=1 so sum<1
  u = runif(1)
  sum = sum +y
  i=i+1
}
X =i

#generating normal distribution using Box muller method 
#here as a note, each time we are generating a pair of normal random variable Z1 and Z2 
# Generate 5000 pairs of normal random variables and plot both histograms

n= 5000
U1= runif(n)
U2 = runif(n)
Z1 = sqrt(-2*log(U1))*cos(2*pi*U2)
Z2 = sqrt(-2*log(U1))*sin(2*pi*U2)
hist(Z1, label = T)


#generate geometric(p)
k=1
p=0.2
while(runif(1)>p){k=k+1}
k
result <- ks.test(k,'pgeom',p)
p_value <- result$p.value
if(p_value>0.05){
  print("it follows geometric")
}else {
  print("it is not")
}

#generate negativebinomial(r,p)
k=1 
p=0.2
r=2
success=0
while(success<r){
  if(runif(1)>p){k=k+1 
  print(0)}
  else{
  success=success+1 
   print(1) }
}

k+r-1 #number of trials until the rth sucess
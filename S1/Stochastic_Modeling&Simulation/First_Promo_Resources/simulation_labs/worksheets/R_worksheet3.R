#EXO 1 
#qst 1 
CLG <- function(m,a,b,y0,n){
  y <-y0
  for (i in 2:n){
  y[i]= (a*y[i-1]+b)%%m}
  #print(y)
  print(y/m)
}
  
X <- CLG(10^3,121,567,0,20)

#test Khi-deux 
m <- 10 
L <- seq(from=0, to=1,by=1/m) 
V <- c()

for (i in 1:(length(L)-1)){
  V[i]<- sum(X> L[i]& X< L[i+1])
}
print(V)

chi <- 0
for (i in 1:length(V)){
  chi= chi+((V[i]-2)^2)/2 
}
print(chi)

alpha <-0.05
if(chi<qchisq(1-alpha,m-1)){
  print("the numbers generated are random")
}else{
  print("the numbers generated are not random ")
}

#qst 3 
X <- CLG(10^3,121,567,0,10^4)
hist(X,breaks = 10,col="red")
hist(runif(10^4),add=TRUE,col="green",breaks=10)

#qst 5,6
X <- CLG(10^3,121,567,0,20)
Y <- CLG(10^3,121,567,1,20)

#------------------------------------------------------------------------------------------------------------------------#


#EXO 2
#qst 1 
pile <-0
face <- 0
n <-0

simulate_coin_toss <- function(n, p) {
  u <- runif(n,min=0,max=1)
  for(i in 1:length(u)){
    if(u[i]<=p){
      pile = pile+1
    }else{
      face =face +1
    }
  }
  cat("the number of pile",sum(pile),"the frequency of pile",sum(pile)/n,"\n")
  cat("the number of face",sum(face),"the frequency of face",sum(face)/n,"\n")
}

V <- c(5, 10, 50, 100, 10^3, 10^4, 10^5, 10^6)
for( n in V){
  simulate_coin_toss (n,0.5)
}

#qst 2
fortune_initiale <- 40

jeux <- function(p, gain, perte) {
  fortune <- fortune_initiale
  while (fortune < 80 && fortune > 0) {  
    u <- runif(1, min = 0, max = 1)
    if (u <= p) {
      fortune = fortune + gain
    } else {
      fortune = fortune - perte
    }
  }
  cat("fortune totale :", fortune, "\n")
}

jeux(3/4, 10, 10)
jeux(3/4, 10, 20)
jeux(3/4, 20, 10) 

#qst 3 
jeux(1/2, 10, 10)
jeux(1/2, 10, 20)
jeux(1/2, 20, 10)

#another way to do it 
Game <- function(G,G1,P1,p,F){
  i=0
  while(G>0 & G<F){
    u=runif(1)
    u <- ifelse(u<p,0,1)
    ifelse(u==1,G <- G+G1, G <- G-P1 )
    i=i+1
  }
  paste("nombre de jeux effectués",i)
}
Game(40,70,10,1/2,80)

#EXO 3
Logistic <- function(alpha, beta,n){
  u <- runif(n)
  x <- alpha - beta*log(1/u-1)
  return  (x)
}
X <- Logistic(1,1,10^4)
Y <- Logistic(3,1,10^4)

#verification (test of uniformity) => we use kolmogorov since it is continuous dist 

#method 1: graphique 

hist(X,breaks = 10,col="purple")
hist(rlogis(10^4,1,1),add=TRUE,col="blue",breaks=10)

hist(Y,breaks = 10,col="purple")
hist(rlogis(10^4,3,1),add=TRUE,col="blue",breaks=10)

#method 2: the numerical method (use predefined function ks.test)

p_result <- ks.test(X, "plogis", 1, 1)

print(p_value <- p_result$p.value)
alpha_theoretical <- 0.05

if (p_value > alpha_theoretical) {
  print("X follows the same logistic distribution; can't reject the null hypothesis")
} else {
  print("X does not follow the same distribution")
}
if(mean(X)==alpha)
{
  print("it is true")
}
#comparer deux samples ks.test(x1,x2)

#Erlang distribution

Erlang <- function(lambda,range,n){
  x<- c()
  for(i in 1:n ){
    u <- runif(range)
    x[i] <- (-1/lambda)*sum(log(1-u))
  }
  x
}

#the only diff between erlang and gamma is that the first has just int lamda but the second one its lambda can be a real number 
#on a obtenu lamba de erlang = range/lambda de l'expo 
# in gamma we take rate is lambda (rate= 1/scale)
x1<- Erlang(4,2,10^4)
x2 <- rgamma(10^4,shape=4,scale=1/2)
hist(x1,nclass=10,col="green")
hist(x2,nclass=10,add=T,col="red")
p_result2 <- ks.test(x1,"pgamma",4,1/2)



p_result <- ks.test(x1,x2)

print(p_value <- p_result$p.value)
alpha_theoretical <- 0.05

if (p_value > alpha_theoretical) {
  print("X follows the same logistic distribution; can't reject the null hypothesis")
} else {
  print("X does not follow the same distribution")
}


#qst 3 
AcceptReject <- function(a,b){
  x <- c()
    while(u2[i] <= ((x^2*sqrt(25-x^2))/(c*g))){
    u1[i] <- runif(1)
    u2[i] <- runif(1)
    g <- 1/ b-a
    c <- 192 
    x = a + (b-a)*u1[i]
    x[i] <- x 
    i=i+1
    }
  return(x)
}
X <- AcceptReject(0,4)

#qst 4
#Hyperexponentielle díordre 2
Hyperexponentielle <- function(p,lambda1,lambda2,n){
  x<- c()
  for(i in 1:n){
  u1 <- runif(1)
  u2 <- runif(1)
  if(u1<=p){
    x[i] <- -1/lambda1*log(1-u2)
  }
  else{
    x[i] <- -1/lambda2 * log(1-u2)
  }
  }
  return(x)
}


X<- Hyperexponentielle(0.25,1,2,10) 

p<- c(0.25,0.75)
lambda <- c(1,2)
theoritical_mean <- sum(p/lambda)
theoritical_variance <- sum(p*(2/lambda^2)) - theoritical_mean^2

mean(X)-theoritical_mean
var(X)-theoritical_variance



#tests 
#couldn't do it since there is no cumulative dist for Hyperexponentielle => how to do it 

#qst 5 => binomial  #refaire later on 
binomial <- function(p, n) {
  B <- numeric(n)
  B[1] <- 0
  for (i in 2:n) {
    u <- runif(1)
    if (u < p) {
      B[i] <- B[i-1] + 1
    } else {
      B[i] <- B[i-1]
    }
  }
  return(B)
}

y<- binomial(1/4,10)
x1 <- binomial(1/4,10^4)
Bin <- function(size,n,p){
  x <- c()
  for(i in 1:size){
    x[i] <- sum(runif(n)<p)
  }
}
X <- Bin(10^4,10,1/4)

chisq.test(table(X),p=dbinom(0:10,40,1/4)) #correct this later on 
#test 
# Plot histogram for the generated binomial distribution
hist(X, nclass = 10, col = "green", main = "Binomial Distribution n=10^4, p=1/4")

# Plot histogram for a theoretical binomial distribution with the same parameters
hist(rbinom(10, size = 10^4, prob = 1/4), add = TRUE, col = "blue", breaks = 10)


# Perform the Kolmogorov-Smirnov test between the two binomial distributions
results <- ks.test(x1, "pbinom", 10^4, 1/4)
print((p_value <- results$p.value))

alpha_theoretical <- 0.05

if (p_value > alpha_theoretical) {
  print("X follows the same binomial distribution; can't reject the null hypothesis")
} else {
  print("X does not follow the same distribution")
}

#qst 6 : poisson dist 
poisson <- function(lambda,n){
  x <- numeric(n)
  for (i in 1:n){
    k <- 0 
    p <- exp(-lambda)
    u <- runif(1)
    f <- p
 
    while(u>f){
      k = k+1 
      p <- (lambda / k) * p
      f <-  f+p 
    }
    x [i] <- k  
  }
  return (x)
  
}

x1 <- poisson(5,10^4)


#test 
# Plot histogram for the generated binomial distribution
hist(x1, nclass = 10, col = "pink", main = "poisson Distribution n=10^4, lambda=5")

# Plot histogram for a theoretical binomial distribution with the same parameters
hist(rpois(10^4,5), add = TRUE, col = "purple", breaks = 10)


#perfom test Chi deux (later on )


#loi normale 
#m is the number of the variables X that follows a normale distribution that we want to generate 
# for n=12 uniform distribution we generate a variable x
normale <- function(m,n,std,mean){
  x <-  numeric(m)
  for(j in 1:m){
  somme_u <- 0 
  for (i in 1:n)
  {
    u <- runif(n)
    somme_u = sum(u) 
  }
  x[j] <- ((somme_u - (n/2))*std*sqrt(12/n))+ mean
  }
  return (x)
}

X <- normale(10^4,12,2,2)



#test 
# Plot histogram for the generated binomial distribution
hist(X, nclass = 20, col = "blue", main = "normal Distribution std=2, mean=2")

# Plot histogram for a theoretical binomial distribution with the same parameters
hist(rnorm(10^4,mean=2,sd=2), add = TRUE, col = "yellow", breaks = 20)


# Perform the Kolmogorov-Smirnov test between the two binomial distributions
results <- ks.test(X, "pnorm",2,2 )
print((p_value <- results$p.value))

alpha_theoretical <- 0.05

if (p_value > alpha_theoretical) {
  print("X follows the same Normal distribution; can't reject the null hypothesis")
} else {
  print("X does not follow the same distribution")
}

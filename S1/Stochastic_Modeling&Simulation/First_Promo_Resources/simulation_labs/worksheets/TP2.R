#lab 2 

#EXO 1

# generate a vector of n normal distibuted varibales
NormalDist = function(n){
  
  u1 = runif(n)
  u2 = runif(n)
  Z1 = (-2*log(u1))^0.5*cos(2*pi*u2)
  
  return (Z1)
}


VecteurGaussien <- function(mean, C, n){
  # Get the number of variables from the length of the mean vector
  num_vars <- length(mean)
  
  # Cholesky decomposition of the covariance matrix
  chol_decomp <- chol(C)
  
  # generates a matrix where each column corresponds to a different standard normal rv, and there are n observations for each variable.
  normal_matrix <- sapply(1:num_vars, function(x) NormalDist(n))
  
  # performs the matrix multiplication of the Cholesky decomposition with the transposed random matrix. 
  transformed_matrix <- t(t(chol_decomp) %*% t(normal_matrix))
  
  # and add the mean vector to each observation
  for(i in 1:n){
    transformed_matrix[i,] <- transformed_matrix[i,] + mean
  }
  
  print(cov(normal_matrix))
  print(colMeans(normal_matrix))
  return(transformed_matrix)
}

mean <- c(1, 1, 2)
covariance <- matrix(c(1, 1, 3,
                       1, 4, 4,
                       3, 4, 11), nrow=3, byrow=TRUE)

observations <- VecteurGaussien(mean, covariance, 1000)

print(cov(observations))
print(colMeans(observations))

#EXo 3:

queue <- function(lambda, mu, npersons ) {
  total_time <- 0
  n <- 0
  num_arrivals <- 0
  
  # Create empty vectors to store data
  n_values <- numeric(npersons)
  time_values <- numeric(npersons)
  
  while (num_arrivals < npersons) {
    time <- rexp(1, lambda + mu)
    
    u <- runif(1, 0, 1)
    #la somme cummulative d'un arrivé et le resultat de time(inter arrival time)et le total_time (the time of the arrival of the next customer)
    total_time <- total_time + time
    
    if (u < (lambda / (lambda + mu))) {
      n <- n + 1
      num_arrivals <- num_arrivals + 1
    } else {
      if (n > 0) {
        n <- n - 1
      } else {
        n <- n + 1
      }
    }
    
    # Store values at each iteration
    n_values[num_arrivals] <- n
    time_values[num_arrivals] <- total_time
  }
  
  # Plot the data
  plot(time_values, n_values, type = "s", col = "blue",
       xlab = "Total Time", ylab = "Number in System",
       main = "Queue Simulation")
  
}
# Run the simulation and plot the results
queue(2, 1, 2000)



#EXO 2 
P <- matrix(c(1/4, 1/2, 1/4,
                       1/3, 1/3, 1/3,
                       1/2, 1/4, 1/4), nrow=3, byrow=TRUE)

PI <- c(1,0,0)
DescreteMC <- function(P,PI){
  state <- 1
  u =runif(1)
  
}


#monte carlo 

M <- c()
for (i in 1:1000){
  x = rnorm(i,5,1)
  M[i] = mean(X)
}


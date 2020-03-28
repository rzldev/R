## Conditionals are expressions that perform different computations or 
# actions depending on whether a predefined boolean condition is 
# TRUE or FALSE

x <- rnorm(1)

if (x > 1) {
  answer <- 'Greater than 1'
} else if (x >= 0) {
  answer <- 'Between 0 and 1'
} else {
  answer <- 'Less than 0'
}

print(answer)
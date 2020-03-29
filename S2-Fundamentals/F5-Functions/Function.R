## function is an object so the R interpreter is able to pass control 
# to the function, along with arguments that may be necessary for the function 
# to accomplish the actions.

rnorm(5)
c(1, 2, 3)
print('Hello World!')

## Getting help
?rnorm

## Add arguments to the function
rnorm(n=5, sd=8, mean=10)
seq(from =10, to=20, along.with=c('a', 'b', 'c'))

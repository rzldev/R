## Vector is a basic data structure in R. It contains element of the same type.
## c() -> Combine Values Into A Vector Or List

MyFirstVector <- c(3, 45, 56, 123)
MyFirstVector

is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

MySecondVector <- c(4L, 56L, 76L, 234L)
MySecondVector

is.numeric(MySecondVector)
is.integer(MySecondVector)
is.double(MySecondVector)

MyThirdVector <- c('H', '123', 'My Third Vector')
MyThirdVector

is.character(MyThirdVector)
is.numeric(MyThirdVector)

## seq() -> Generate regular sequences
seq(1, 15)
1:15

MySeq <- seq(1, 15, 2)
MySeq

## rep() -> Replicate Elements Of Vectors And Lists
rep(3, 10)
MyRep <- rep('rep', 5)
MyRep

x <- c(80, 20)
y <- rep(x, 10)
y

## Using brackets
word <- c('a', 'b', 'c', 'd', 'e')
word[1]
word[2]
word[3]
word[-1]
word[1:3]
word[3:5]
word[c(1, 3, 5)]
word[c(-2 ,-4)]
word[-3:-5]
word[1:2]

## Vector loops
x <- rnorm(5)

## R-specific programming loop
for (i in x) {
  print(i)
}

## Conventional programming loop
for (j in 1:5) {
  print(x[j])
}

## Vectorized and De-Vectorized Approach
N <- 100
random1 <- rnorm(N)
random2 <- rnorm(N)

# Vetorized approach
c <- random1 * random2

# De-Vectorized approach
# NA -> 'Not Available' / Missing Values
d <- rep(NA, N)
for (i in 1:N) {
  d[i] <- random1[i] * random2[i]
}
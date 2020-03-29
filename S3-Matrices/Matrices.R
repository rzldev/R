## matrix() -> creates a matrix from the given set of values.
?matrix
my.data <- 1:20
my.data

A <- matrix(my.data, 4, 5)
A
A[2, 3]

B <- matrix(my.data, 4, 5, byrow=T)
B
B[2, 5]

## rbind() -> combines vector, matrix or data frame by rows
?rbind
r1 <- c('I', 'am', 'happy')
r2 <- c('What', 'a', 'day')
r3 <- c(1, 2, 3)
RowCombine <- rbind(r1, r2, r3)
RowCombine

## cbind() -> combines vector, matrix or data frame by columns
?cbind
c1 <- 1:5
c2 <- -1:-5
ColumnCombine <- cbind(c1, c2)
ColumnCombine

## Naming vectors
echo <- 1:5
echo

names(echo) <- c('a', 'b', 'c', 'd', 'e')
echo

## Remove name from vectors
names(echo) <- NULL
echo

## Naming matrix
temp.vec <- rep(c('A', 'B', 'C'), 3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c('row 1', 'row 2', 'row 3')
Bravo

colnames(Bravo) <- c('col 1', 'col 2', 'col 3')
Bravo
Bravo['row 3','col 1']

MyMatrix <- seq(1, 21, 2)
MyMatrix

Delta <- matrix(MyMatrix, 3, 3)
Delta

rownames(Delta) <- c('row 1', 'row 2', 'row 3')
Delta

colnames(Delta) <- c('col 1', 'col 2', 'col 3')
Delta
Delta['row 3','col 1']
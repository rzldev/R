## Import Data
?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

# Method 2: Set the working directory and read the data
setwd('C:\\Users\\rzl\\Documents\\Github\\R\\S4-DataFrames')
getwd()
stats <- read.csv('Demographic-Data.csv')
stats

## Exploring Data
stats

# nrow() -> return the number of rows present
nrow(stats)

# ncol() -> return the number of columns present
ncol(stats)

# head() -> return the first several rows of a matrix or data frame
head(stats, n=10)

# tail() -> return the last several rows of a matrix or data frame
tail(stats, n=10)

# str() -> compactly Display The Structure Of An Arbitrary R Object
str(stats)

# summary() -> produce result summaries of the results of various model fitting functions
summary(stats)


## Using $ Sign
stats

stats[, 'Internet.users']
stats$Internet.users

stats[2, 'Internet.users']
stats$Internet.users[2]

str(stats)
levels(stats$Income.Group)
levels(stats$Country.Name)


## Basic Operation On Data Frame
# Subsetting
stats[3:9, ]
stats[c(4, 100), ]

# Working with brackets
stats[1, ]
is.data.frame(stats[1, ])

stats[, 1]
is.data.frame(stats[, 1])

stats[, 1, drop=F]
is.data.frame(stats[, 1, drop=F])

# Doing arithmetic on the data frame
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

# Add column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users

# Remove column
head(stats)
stats$MyCalc <- NULL


## Filtering Data Frame
head(stats)
filter <- stats$Internet.users < 2
filter

stats[filter, ]

stats[stats$Birth.rate > 40, ]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2, ]

levels(stats$Income.Group)
stats[stats$Income.Group == 'High income', ]


## Visualizing Data Frame
qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(2), colour=I('red'))

# Set color by income level
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(2), colour=Income.Group)


## Creating a Data Frame
Countries_2012_Dataset
Codes_2012_Dataset
Regions_2012_Dataset

# method 1
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)

# giving coloumn names
colnames(mydf) <- c('Country', 'Code', 'Region')
head(mydf)
tail(mydf)
summary(mydf)

# remove data frame
rm(mydf)

# method 2
mydf <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)


## Merge Two Data Frame
head(stats)
head(mydf)

MergedDataFrame <- merge(stats, mydf, by.x='Country.Code', by.y='Code')
head(MergedDataFrame)

# Remove the same coloumn
MergedDataFrame$Country <- NULL
head(MergedDataFrame)
str(MergedDataFrame)

## Visualizing Data Frame
qplot(data=MergedDataFrame, x=Internet.users, y=Birth.rate, colour=Region, size=I(2))

# Shape
qplot(data=MergedDataFrame, x=Internet.users, y=Birth.rate, colour=Region, size=I(4), shape=I(19))

# Transparency
qplot(data=MergedDataFrame, x=Internet.users, y=Birth.rate, colour=Region, size=I(4), shape=I(19), alpha=I(0.7))

# Title
qplot(data=MergedDataFrame, x=Internet.users, y=Birth.rate, colour=Region, size=I(4), shape=I(19), alpha=I(0.7), 
      main='Birth Rate vs Internet Users')

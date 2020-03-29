### Data
## Import data
getwd()
setwd('c:\\Users\\rzl\\Documents\\Github\\R\\S5-AdvancedVisualization')
getwd()

movies <-read.csv('Movie-Ratings.csv')
head(movies)

# Change the coloumn names
colnames(movies) <- c('Film', 'Genre', 'CriticRating', 'AudienceRating', 'BudgetMillions', 'Year')
head(movies)
tail(movies)

str(movies)
summary(movies)

## Factors
# factor() -> encode a vector as a factor
factor(movies$Year)

movies$Year <- factor(movies$Year)
head(movies)
str(movies)
summary(movies)


### Aesthetics & Geometries
## Import library
library(ggplot2)

## Visualizing
# aes() -> describe how variables in the data are mapped to visual properties (aesthetics) of geoms
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))

# Add geometry
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating)) + geom_point()

# Add colors by Genre
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre)) + geom_point()

# Add sizes by BudgetMillions
ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions)) + geom_point()

## Plotting With Layers
p <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))
p

# Point
p + geom_point()

# Line
p + geom_line()

# Multiple layers
p + geom_point() + geom_line()
p + geom_line() + geom_point()

## Overriding Aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))

# Add geometry
q + geom_point()

# Overiding aes()
q + geom_point(aes(size=CriticRating))

q + geom_point(aes(colour=BudgetMillions))

q + geom_point(aes(x=BudgetMillions)) + xlab('Budget Millions $$$')

q + geom_line() + geom_point()

q + geom_line(size=1) + geom_point()

## Mapping vs Setting
r <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre, size=BudgetMillions))
r + geom_point()

# Change color with mapping
r + geom_point(aes(colour=Genre))
# Change color with setting
r + geom_point(colour='red')

# Change size with mapping
r + geom_point(aes(size=BudgetMillions))
# Change size with setting
r + geom_point(size=3)


### Geometries & Statistics
s <- ggplot(data=movies, aes(x=BudgetMillions))

## Histograms
s + geom_histogram(binwidth=15)

# Add color
s + geom_histogram(binwidth=15, aes(fill=Genre))

# Add border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour='black')

## Density charts
s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre), position='stack')


### Statistics
?geom_smooth

t <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))

## Smooth
t + geom_point() + geom_smooth(fill=NA)

## BoxPlot
u <- ggplot(data=movies, aes(x=Genre, y=AudienceRating, colour=Genre))

u + geom_boxplot()

# Add size
u + geom_boxplot(size=1.2)

# Add point
u + geom_boxplot(size=1.2) + geom_point()

# Add jitter
u + geom_boxplot(size=1.2) + geom_jitter()

u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)


### Facets
v <- ggplot(data=movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth=10, aes(fill=Genre), colour='black')

## Facets Grid
v + geom_histogram(binwidth=10, aes(fill=Genre), colour='black') + 
  facet_grid(Genre~.)

# Add scales
v + geom_histogram(binwidth=10, aes(fill=Genre), colour='black') + 
  facet_grid(Genre~., scales='free')

## ScatterPlots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, colour=Genre))
w + geom_point(size=3)

# Add facets grid
w + geom_point(size=3) + facet_grid(Year~.)
w + geom_point(size=3) + facet_grid(.~Year)

w + geom_point(size=3) + facet_grid(Genre~.)

w + geom_point(size=3) + facet_grid(Genre~Year)

w + geom_point(aes(size=BudgetMillions)) + geom_smooth(fill=NA) + facet_grid(Genre~Year)


### Coordinates
x <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, size=BudgetMillions, colour=Genre))

x + geom_point()

## Limits
x + geom_point() + xlim(50, 100)
x + geom_point() + xlim(50, 100) + ylim(50, 100)

## Zoom
y <- ggplot(data=movies, aes(x=BudgetMillions))
y + geom_histogram(binwidth=10, aes(fill=Genre), colour='black')

y + geom_histogram(binwidth=10, aes(fill=Genre), colour='black') + coord_cartesian(ylim=c(0, 50))


## The old ones
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth(fill=NA) + 
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0, 100))


### Theme
z <- ggplot(data=movies, aes(x=BudgetMillions))
za <- z + geom_histogram(binwidth=10, aes(fill=Genre), colour='black')
za

## Axes Labels
za + xlab('Money Axis') + ylab('Number of Movies')

# Label formatting
za + 
  xlab('Money Axis') + 
  ylab('Number of Movies') + 
  theme(axis.title.x = element_text(colour='DarkGreen', size=20),
        axis.title.y = element_text(colour='Red', size=20))

# Tick mark formatting
za + 
  xlab('Money Axis') + 
  ylab('Number of Movies') + 
  theme(axis.title.x = element_text(colour='DarkGreen', size=20),
        axis.title.y = element_text(colour='Red', size=20),
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15))

# Legend formatting
za + 
  xlab('Money Axis') + 
  ylab('Number of Movies') + 
  theme(axis.title.x = element_text(colour='DarkGreen', size=20),
        axis.title.y = element_text(colour='Red', size=20),
        
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=8),
        legend.position = c(1, 1),
        legend.justification = c(1, 1))

# Title

za + 
  xlab('Money Axis') + 
  ylab('Number of Movies') + 
  ggtitle('Movie Budget Distribution') +
  theme(axis.title.x = element_text(colour='DarkGreen', size=20),
        axis.title.y = element_text(colour='Red', size=20),
        
        axis.text.x = element_text(size=15),
        axis.text.y = element_text(size=15),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=8),
        legend.position = c(1, 1),
        legend.justification = c(1, 1),
        
        plot.title = element_text(colour='DarkBlue', size=30))

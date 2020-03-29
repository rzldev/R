## Install qplot
install.packages('ggplot2')

## import qplot
library(ggplot2)
?qplot

## Visualize data with qplot
qplot(data=stats, x=Internet.users)
qplot(data=stats, x=Internet.users, y=Birth.rate)

## Set size
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3))

## Set color
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3), colour=I('blue'))

## boxplot
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3), colour=I('blue'), geom='boxplot')

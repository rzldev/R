MyPlot <- function (data, rows) {
  Data <- data[rows, , drop=F]
  matplot(t(Data), type='b', pch=15:18, col=c(1:4, 6))
  legend('bottomleft', inset=0.01, legend=Players[rows], col=c(1:4, 6), pch=15:18, horiz=F)
}

MyPlot(Games, 1:5)
MyPlot(Games, )

# Salary
MyPlot(Salary)
MyPlot(Salary / Games)
MyPlot(Salary / FieldGoals)

# In-Game Metrics
MyPlot(MinutesPlayed)
MyPlot(Points)

# In-Game Metrics Normalized
MyPlot(FieldGoals / Games)
MyPlot(FieldGoals / FieldGoalAttempts)
MyPlot(FieldGoalAttempts / Games)
MyPlot(Points / Games)

# Interesting Observation
MyPlot(MinutesPlayed / Games)
MyPlot(Games)

# Time is Valuable
MyPlot(FieldGoals / MinutesPlayed)

# Player Style
MyPlot(Points / FieldGoals)

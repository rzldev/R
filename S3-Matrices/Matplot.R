FieldGoals

## t() -> Matrix transpose
t(FieldGoals)

## matplot() -> Plot the columns of one matrix against the columns of another
?matplot
matplot(t(FieldGoals))
matplot(t(FieldGoals), type='b')

matplot(t(FieldGoals), type='b', pch=15:18, col=c(1:4, 6))

## legend() -> This function can be used to add legends to plots
?legend
legend('bottomleft', inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)


matplot(t(FieldGoals/FieldGoalAttempts), type='b', pch=15:18, col=c(1:4, 6))
legend('bottomleft', inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)


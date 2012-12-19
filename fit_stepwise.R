library(MASS)
fit <- lm(obrate~.,data=obesity_sig)
step <- stepAIC(fit, direction="both")
step$anova # display results



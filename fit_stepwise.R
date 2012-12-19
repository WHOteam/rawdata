#pre-process to update with significant transformations
obesity_update <- read.csv("obesity_update.csv")
obesity_update<-transform(obesity_update,logimports=log(ppimports),loggdp=log(ppgdp),logimportpath=log(log((USimportpath))))
obesity_update <- obesity_update[,c(-4,-6,-8)]

library(MASS)
fit <- lm(obrate~.,data=obesity_update)
step <- stepAIC(fit, direction="both")
step$anova # display results

#final model - with graph-theoretic varialbes
model <- lm(obrate~birth_fertility+population+USborderpath+import_diff+export_diff+borders+loggdp,data=obesity_update)

#create stepwise model without them

model_w <- lm(obrate~birth_fertility+population+pop_growth+logimports+loggdp,data=obesity_update)
###################################SENSITIVITY ANALYSIS###################################
sensitivity_met_data <- read.table("../data/sensitivity_met_data.txt", sep=" ", header=TRUE)

print(summary(sensitivity_met_data))

#Plotter alle strålingsflukser
par(mfrow=c(1,1))
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$Rs_downwell, type = "l", col="blue", 
     xlab = "Date", ylab = expression(paste("Energy flux ( ", W/m^2," )", sep="")),ylim=c(-100,900))
points(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$Rnet, type = "l", col="red")
points(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$Rl_downwell, type ="l", col="green")
legend(as.POSIXct(sensitivity_met_data$X)[5], 1000, 
       legend=c(expression(paste(R[net]),Rl_downwell, Rs_downwell)), bty="n",
       col=c("red", "green", "blue"), text.width = 1, lwd = 2, lty=1)

#Plotter rH og T_b_1477
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$rH, type="l", col="purple",
     xlab = "Date", ylab="Relative humidity (%)")
par(new=TRUE)
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$T_b_1477, axes=FALSE, type="l",
     col="brown", xlab="Date", ylab=" ")
axis(side=4)
mtext("Temp (Celsius)", side=4, line=0)
legend(as.POSIXct(sensitivity_met_data$X)[5], 3, bty="n",
       legend=c("rH", "T_b_1477"), col=c("purple", "brown"), text.width = 1, lwd = 1, lty=1)

#Plotter rH og Rs_downwell
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$Rs_downwell, type="l", col="purple",
     xlab = "Date", ylab = expression(paste("Energy flux ( ", W/m^2," )", sep="")))
par(new=TRUE)
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$rH, axes=FALSE, type="l",
     col="brown", xlab="Date", ylab=" ")
axis(side=4)
mtext("Relative humidity (%)", side=4, line=0)
legend(as.POSIXct(sensitivity_met_data$X)[1300], 70, bty="n",
       legend=c("Rs_downwell", "rH"), col=c("purple", "brown"), text.width = 1, lwd = 1, lty=1)

#Plotter Rs_downwell og T_b_1477
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$Rs_downwell, type="l", col="purple",
     xlab = "Date", ylab = expression(paste("Energy flux ( ", W/m^2," )", sep="")))
par(new=TRUE)
plot(as.POSIXct(sensitivity_met_data$X), sensitivity_met_data$T_b_1477, axes=FALSE, type="l",
     col="brown", xlab="Date", ylab=" ")
axis(side=4)
mtext("Temperature (Celsius)", side=4, line=0)
legend(as.POSIXct(sensitivity_met_data$X)[1200], 12, bty="n",
       legend=c("Rs_downwell", "T_b_1477"), col=c("purple", "brown"), text.width = 1,lwd = 1,lty=1)


#Correlation matrix
print(cor(sensitivity_met_data[,c("Rl_downwell", "Rs_downwell", "AT_mbar", "rH", "T_b_1477",
                                  "D_g_1477", "F_1_s_g_1477", "Rnet")], use="complete"))

#Scatterplot matrix
pairs(sensitivity_met_data[,2:9])

#plot(as.Date(sensitivity_met_data$X), sensitivity_met_data$Rl_downwell, type="l")

#PCA
pca_mod <- prcomp(~AT_mbar+D_g_1477+F_1_s_g_1477+rH+Rl_downwell+Rs_downwell+T_b_1477,
                  scale.=TRUE, data=sensitivity_met_data)
print(pca_mod)
print(summary(pca_mod))
screeplot(pca_mod, main="Screeplot")
biplot(pca_mod, main="Biplot")

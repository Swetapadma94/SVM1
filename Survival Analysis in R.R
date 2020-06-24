# Survival Analysis in R

# install.packages('survminer')
# install.packages("survival")

library(survminer)
library(survival)

??survminer
??survival
setwd("E://Excelr Data//Day Wise//Day 33 Survival Analytics//Dataset")

survival_unemployment1 <- read.csv("survival_unemployment.csv")
View(survival_unemployment1)
attach(survival_unemployment1)
str(survival_unemployment1)

# Define variables 
time <- spell
event <- event
# X <- cbind(logwage, ui, age)
group <- ui  # unemployment insurance can take 2 values 0 or 1 

# Descriptive statistics
summary(time)
summary(event)
# summary(X)
summary(group)
table(group)

# Kaplan-Meier non-parametric analysis
kmsurvival <- survfit(Surv(time,event) ~ 1)

summary(kmsurvival)

plot(kmsurvival, xlab="Time", ylab="Survival Probability")

ggsurvplot(kmsurvival, data=survival_unemployment1, risk.table = TRUE)


# Kaplan-Meier non-parametric analysis by group
kmsurvival1 <- survfit(Surv(time, event) ~ group)
summary(kmsurvival1)

plot(kmsurvival1, xlab="Time", ylab="Survival Probability")
ggsurvplot(kmsurvival1, data=survival_unemployment1, risk.table = TRUE)

###############
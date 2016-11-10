# Data Collection
student.mat <- read.csv("C:/KB/Study/Kaggle data/student-mat.csv")
View(student.mat) 
math<- student.mat

#Libraries and Packages
library("doBy", lib.loc="~/R/win-library/3.2")
library(doBy)
library(dplyr)
library(ggplot2)
library(grid)
library(gridExtra)
library(gtable)

#Subset data and Regression equation
math_GP<- subset(math, math$school=="GP")
math_MS<- subset(math, math$school=="MS")
lm(formula = G3 ~ freetime + failures + goout + Dalc + health + absences  , data= math)
#Final_grade_math= 10.63 + 0.359 * freetime -2.154 * failures -0.51 *gout +0.27 * studytime + 0.09 * alcohol#

#Data Visualization
ggplot(math, aes(x= Walc, y= school, color= sex)) + geom_jitter() + xlab("Weekend Alcohol") + ylab("School") + ggtitle("Weekend alcohol and School")
ggplot(math, aes(x= Dalc, y= school, color= sex)) + geom_jitter() + xlab("Workday Alcohol") + ylab("School") + ggtitle("Workday alcohol and School")

viz1<- ggplot(math, aes(x= Walc, y= school, color= sex)) + geom_jitter() + xlab("Weekend Alcohol") + ylab("School") + ggtitle("Weekend alcohol and School")
viz2<- ggplot(math, aes(x= Dalc, y= school, color= sex)) + geom_jitter() + xlab("Workday Alcohol") + ylab("School") + ggtitle("Workday alcohol and School")
grid.arrange(viz1, viz2)

viz3<- ggplot(math, aes(x= Walc, y= sex, color= school)) + geom_jitter() + xlab("Weekend Alcohol") + ylab("Sex") + ggtitle("Weekend alcohol and Sex")
viz4<- ggplot(math, aes(x= Dalc, y= sex, color= school)) + geom_jitter() + xlab("Workday Alcohol") + ylab("Sex") + ggtitle("Workday alcohol and Sex")

grid.arrange(viz3, viz4)

ggplot(data=math, aes(absences, colour= sex)) + geom_freqpoly() + facet_wrap(~sex)
ggplot(data=math, aes(absences, colour= sex)) + geom_histogram() + facet_wrap(~sex)

viz7<- ggplot(math, aes(x= Dalc, y= freetime, color= school)) + geom_jitter() + xlab("Workday Alcohol") + ylab("Freetime") + ggtitle("Workday alcohol and Freetime") + facet_wrap(~sex)
viz8<- ggplot(math, aes(x= Walc, y= freetime, color= school)) + geom_jitter() + xlab("Weekend Alcohol") + ylab("Freetime") + ggtitle("Weekend alcohol and Freetime") +facet_wrap(~sex)

grid.arrange(viz7, viz8)

viz9<-ggplot(math, aes(x= Dalc, y= absences, color= school)) + geom_jitter() + xlab("Workday Alcohol") + ylab("Absences") + ggtitle("Workday alcohol and absences") + facet_wrap(~sex)
viz10<-ggplot(math, aes(x= Walc, y= absences, color= school)) + geom_jitter() + xlab("Weekend Alcohol") + ylab("Absences") + ggtitle("Weekend alcohol and absences") + facet_wrap(~sex)

grid.arrange(viz9, viz10)

viz11<-ggplot(math, aes(x= alcohol, y= G3, color= sex)) + geom_jitter() +  xlab("Alcohol") + ylab("Final grade") + ggtitle("Alcohol and Final Grade") +facet_wrap(~school)


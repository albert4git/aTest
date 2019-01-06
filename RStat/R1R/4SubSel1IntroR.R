#!/usr/bin/env Rscripto
data(mtcars)
library(ggplot2)
df <- mtcars[, c("mpg", "cyl", "wt")]
X11 ()
head(df)
plot(df)
dev.copy(jpeg,filename="magnit5Plot.jpg");
dev.off ();
print("magnitPlot.jpg")
#plot (x,y)
#=============================================================
load("magnitPlot.jpg")
ls()
png(filename="./Magnit.png")
plot(df)
dev.off()



#====================================================================
mydata<- read.csv("/home/red/git/aTest/RStat/R1R/dot2Gad2.csv")
library(ggplot2)
attach(mydata)
head(mydata)
X11 ()
plot(mydata)
dev.copy(jpeg,filename="Stenka.jpg");

#====================================================================
load("Stenka.jpg")
ls()

var.test(DotSD, GadDD)



#=============================================================
#!/usr/bin/env Rscripto
data(mtcars)
df <- mtcars[, c("mpg", "cyl", "wt")]
head(df)
X11 ()
plot(df)
#plot (x,y)
#print(magnit2Plot.jpg)
dev.copy(jpeg,filename="magnit2Plot.jpg");
dev.off ();
ls()
load("magnit2Plot.jpg")
#=============================================================
#=============================================================


# qplot(x, y=NULL, data, geom="auto", 
#       xlim = c(NA, NA), ylim =c(NA, NA))


mydata<- read.csv("/home/red/git/aTest/RStat/R1R/beaCSLR4.csv")
attach(mydata)
boxplot(mydata)
var.test(RCS, LCS)
var.test(RCS, Bone)
var.test(RCS, Medulla)
var.test(RCS, LCS)
# var.test(PeriL, MO1)
# boxplot(PeriL, MO1)
text(500,"*",cex=2)

mtext("*", side=3, line=0, at=2, cex=1.2)
mtext(c("Low","High"),side=1,line=2,at=c(5,7))
text(c(2,2),c(37,35),labels=c("Non-case","Case"))

mtext("*", side=3, line=0, at=2, cex=1.2)
text(500,"*",cex=2)
text(200,"**",cex=3)
boxplot(mydata)
#**********************************************************

#====================================================================
mydata<- read.csv("/home/red/git/aTest/RStat/R1R/bea5roi.csv")
attach(mydata)
library("ggplot2") # wird das Packet dann geladen.
pp <- ggplot(mtcars, aes(factor(cyl), mpg)) + geom_boxplot()
df1 <- data.frame(a = c(1, 1:3,3), b = c(39, 40, 40, 40, 39))
df2 <- data.frame(a = c(1, 1,2, 2), b = c(35, 36, 36, 35))
df3 <- data.frame(a = c(2, 2, 3, 3), b = c(24, 25, 25, 24))
#-------------------------------------------------------
pp + geom_line(data = df1, aes(x = a, y = b)) + annotate("text", x = 2, y = 42, label = "*", size = 8) +
  geom_line(data = df2, aes(x = a, y = b)) + annotate("text", x = 1.5, y = 38, label = "**", size = 8) +
  geom_line(data = df3, aes(x = a, y = b)) + annotate("text", x = 2.5, y = 27, label = "n.s.", size = 8)
#-------------------------------------------------------
boxplot(len ~ dose, data = ToothGrowth, outline=F)
text(x=2,y=max(boxplot.stats(ToothGrowth$len[ToothGrowth$dose==1])$stat), paste("nn",sum(ToothGrowth$dose==1),sep="="), pos=3, offset=.2, cex=.8)


#====================================================================
mydata<- read.csv("/home/red/git/aTest/RStat/R1R/dot2Gad2.csv")

attach(mydata)
boxplot(mydata)

var.test(DotSD, GadDD)

var.test(GadSD, GadDD)
var.test(DotSD, DotDD)



#====================================================================
mydata<- read.csv("/home/red/git/aTest/RStat/R1R/intro_auto.csv")
library("ggplot2") # wird das Packet dann geladen.
attach(mydata)
X11()
png(filename="nemezida.png")
plot(mydata)
dev.off()
#=============================================
img <- load.image('./nemezida.png')
plot(img)
#====================================================================



#require(png)
##plot(1:10, ty="n")
#img <- readJPEG("./nemezida.png")
#rasterImage(img,2,2,4,4)
##====No================================================================
#mydata<- read.csv("/home/red/git/aTest/RStat/R1R/intro_auto.csv")
#attach(mydata)
##X11()
#require(jpeg)
#jpeg(filename="nemezida.png")
#boxplot(mydata)

#img <- readJPEG("./nemezida.png")
#plot(1:10, ty="n")
#====================================================================
mydata<- read.csv("/home/red/git/aTest/RStat/R1R/intro_auto.csv")
attach(mydata)

# List the variables
names(mydata)
plot (mpg ~ weight)

#show???

# Show first lines of data
head(mydata)
mydata[1:10,]

# Descriptive statistics
summary(mpg)
sd(mpg)
length(mpg)
summary(price)
sd(price)

# Plotting data --???---
plot (mpg ~ weight)
olsreg1 <- lm(mpg ~ weight)
abline(olsreg1)


# Sort the data
sort(make)

# Frequency tables
table(make)
table (make, foreign)

# Correlation among variables
cor(price, mpg)

# T-test for mean of one group
t.test(mpg, mu=20)

# ANOVA for equality of means for two groups
anova(lm(mpg ~ factor(foreign)))

# OLS regression - mpg (dependent variable) and weight, length and foreign (independent variables)
olsreg <- lm(mpg ~ weight + length + foreign)
summary(olsreg)
# summary(lm(mpg ~ weight + length + foreign))

# Plotting data
plot (mpg ~ weight)
olsreg1 <- lm(mpg ~ weight)
abline(olsreg1)

# Redefining variables 
Y <- cbind(mpg)
X <- cbind(weight, length, foreign)
summary(Y)
summary(X)
olsreg <- lm(Y ~ X)
summary(olsreg) 

# Install and use packages 
# install.packages("plm")
# library(plm)

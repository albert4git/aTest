# Introduction to R
# Copyright 2013 by Ani Katchova
# https://www.youtube.com/watch?v=7cGwYMhPDUY

#============================================
# Set working directory to where csv file is located
setwd("/Users/neuro/aTest/aTest/RStat/R1R/")
mydata<- read.csv("/Users/neuro/aTest/aTest/RStat/R1R/bea5roi.csv")
attach(mydata)
library("ggplot2") # wird das Packet dann geladen.
pp <- ggplot(mtcars, aes(factor(cyl), mpg)) + geom_boxplot()
df1 <- data.frame(a = c(1, 1:3,3), b = c(39, 40, 40, 40, 39))
df2 <- data.frame(a = c(1, 1,2, 2), b = c(35, 36, 36, 35))
df3 <- data.frame(a = c(2, 2, 3, 3), b = c(24, 25, 25, 24))

pp + geom_line(data = df1, aes(x = a, y = b)) + annotate("text", x = 2, y = 42, label = "*", size = 8) +
  geom_line(data = df2, aes(x = a, y = b)) + annotate("text", x = 1.5, y = 38, label = "**", size = 8) +
  geom_line(data = df3, aes(x = a, y = b)) + annotate("text", x = 2.5, y = 27, label = "n.s.", size = 8)

#--------------

boxplot(len ~ dose, data = ToothGrowth, outline=F)
text(x=2,y=max(boxplot.stats(ToothGrowth$len[ToothGrowth$dose==1])$stat), paste("nn",sum(ToothGrowth$dose==1),sep="="), pos=3, offset=.2, cex=.8)

#++++++++++++++++START++++++++++++++++++++++++
# Set working directory to where csv file is located
setwd("/Users/neuro/aTest/aTest/RStat/R1R/")
mydata<- read.csv("/Users/neuro/aTest/aTest/RStat/R1R/dot2Gad2.csv")
attach(mydata)
boxplot(mydata)

var.test(DotSD, GadDD)

var.test(GadSD, GadDD)
var.test(DotSD, DotDD)
#++++++++++++++++START++++++++++++++++++++++++
# Set working directory to where csv file is located
setwd("/Users/neuro/aTest/aTest/RStat/R1R/")
mydata<- read.csv("/Users/neuro/aTest/aTest/RStat/R1R/bea5roi.csv")
mydata<- read.csv("/Users/neuro/aTest/aTest/RStat/R1R/beaCSLR4.csv")
attach(mydata)
boxplot(mydata)
var.test(RCS, LCS)
var.test(RCS, Bone)

var.test(RCS, Medulla)


var.test(RCS, LCS)


var.test(PeriL, MO1)
boxplot(PeriL, MO1)
text(500,"*",cex=2)

mtext("*", side=3, line=0, at=2, cex=1.2)

mtext(c("Low","High"),side=1,line=2,at=c(5,7))

text(c(2,2),c(37,35),labels=c("Non-case","Case"))



mtext("*", side=3, line=0, at=2, cex=1.2)
text(500,"*",cex=2)
text(200,"**",cex=3)

boxplot(mydata)
#**********************************************************
#++++++++++++++++++++++--Working--+++++++++++++++++++++
data1<-data.frame(island = c("A", "B", "B", "A", "A"), count = c(2, 5, 12, 2, 3))
g1<-ggplot(data1) +  geom_boxplot(aes(x = factor(island), y = count)) 
g1 + geom_path(x = c(1, 1, 2, 2), y = c(25, 26, 26, 25))  

data2 <- data.frame(x = c(1, 1, 2, 2), y = c(25, 26, 26, 25))

ggplot(data = data1, aes(x = factor(island), y = count)) +
  geom_boxplot() +
  geom_path(data = data2, aes(x = x, y = y))

#*****************************************************
# http://www.r-bloggers.com/ggplot2-multiple-boxplots-with-metadata/
# https://www.youtube.com/watch?v=RlhnNbPZC0A
# http://stackoverflow.com/questions/13977561/changing-layout-of-boxplot-and-adding-labels-to-it
# http://stats.stackexchange.com/questions/8206/labeling-boxplots-in-r
#++++++++++++++++++++++--Nice--+++++++++++++++++++++
# http://stackoverflow.com/questions/17084566/put-stars-on-ggplot-barplots-and-boxplots-to-indicate-the-level-of-significanc
windows(4,4)

dat <- data.frame(Group = c("S1", "S1", "S2", "S2"),
                  Sub   = c("A", "B", "A", "B"),
                  Value = c(3,5,7,8))  

## Define base plot
p <-
  ggplot(dat, aes(Group, Value)) +
  theme_bw() + theme(panel.grid = element_blank()) +
  coord_cartesian(ylim = c(0, 15)) +
  scale_fill_manual(values = c("grey80", "grey20")) +
  geom_bar(aes(fill = Sub), stat="identity", position="dodge", width=.5)

label.df <- data.frame(Group = c("S1", "S2"),
                       Value = c(6, 9))

p + geom_text(data = label.df, label = "***")
#------
label.df <- data.frame(Group = c(1,1,1, 2,2,2),
                       Value = c(6.5,6.8,7.1, 9.5,9.8,10.1))

# Define arc coordinates
r <- 0.15
t <- seq(0, 180, by = 1) * pi / 180
x <- r * cos(t)
y <- r*5 * sin(t)

arc.df <- data.frame(Group = x, Value = y)

p2 <-
  p + geom_text(data = label.df, label = "*") +
  geom_line(data = arc.df, aes(Group+1, Value+5.5), lty = 2) +
  geom_line(data = arc.df, aes(Group+2, Value+8.5), lty = 2)

r <- .5
x <- r * cos(t)
y <- r*4 * sin(t)
y[20:162] <- y[20] # Flattens the arc

arc.df <- data.frame(Group = x, Value = y)

p2 + geom_line(data = arc.df, aes(Group+1.5, Value+11), lty = 2) +
  geom_text(x = 1.5, y = 12, label = "***")
#--------------------------------------------



text(500,"*",cex=2)
text(200,"**",cex=2)
text(c(25,23,-10,-10,-10,27),"*",cex=2)

#+++++++++++++++
A = c(1, 5, 8, 17, 16, 3, 24, 19, 6) 
B = c(2, 16, 5, 7, 4, 7, 3) 
C = c(1, 1, 3, 7, 9, 6, 10, 13) 
D = c(2, 15, 2, 9, 7) 
junk = list(g1=A, g2=B, g3=C, g4=D) 
boxplot(junk) 

#+++++++++++++++++++++++++++++++++++
boxplot(count ~ spray,data = InsectSprays,axes=F,ylim=c(0,30))
text(c(25,23,-10,-10,-10,27),"*",cex=2)

#+++++++++++++++++++++++++++++++++++++++++++
require(stats)
x <- c(1:100, 1000)
(b1 <- boxplot.stats(x))
(b2 <- boxplot.stats(x, do.conf = FALSE, do.out = FALSE))
stopifnot(b1 $ stats == b2 $ stats) # do.out = FALSE is still robust
boxplot.stats(x, coef = 3, do.conf = FALSE)
## no outlier treatment:
boxplot.stats(x, coef = 0)

boxplot.stats(c(x, NA)) # slight change : n is 101
(r <- boxplot.stats(c(x, -1:1/0)))
stopifnot(r$out == c(1000, -Inf, Inf))
#+++++++++++++++++++++++++++++++++++++++++++
library(ggplot2)

# create fake dataset with additional attributes - sex, sample, and temperature
x <- data.frame(
  values = c(runif(100, min = -2), runif(100), runif(100, max = 2), runif(100)),
  sex = rep(c('M', 'F'), each = 100),
  sample = rep(c('sample_a', 'sample_b'), each = 200),
  temperature = sample(c('15C', '25C', '30C', '42C'), 400, replace = TRUE)
)

# compare different sample populations across various temperatures
ggplot(x, aes(x = sample, y = values, fill = sex)) +
  geom_boxplot() +
  facet_wrap(~ temperature)
#+++++++++++++++++++++++++++++++++++++++++++
# Notched Boxplot of Tooth Growth Against 2 Crossed Factors
# boxes colored for ease of interpretation 
boxplot(len~supp*dose, data=ToothGrowth, notch=TRUE, 
        col=(c("gold","darkgreen")),
        main="Tooth Growth", xlab="Suppliment and Dose")
#+++++++++++++++++++++++++++++++++++++++++++

#+++++++++++++++++++++++++++++++++++++++++++




# List the variables
names(mydata)
plot (PeriR ~ MO1)

# Show first lines of data
head(mydata)
mydata[1:10,]

# Descriptive statistics
summary(PeriR)
sd(PeriR)
length(PeriR)
summary(MO1)
sd(MO1)


#====================================================================
# Read the data
mydata<- read.csv("/Users/neuro/aTest/aTest/RStat/R1R/intro_auto.csv")
mydata<- read.csv("/Users/neuro/aTest/aTest/RStat/R1R/bea5roi.csv")
attach(mydata)

# List the variables
names(mydata)
plot (mpg ~ weight)

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

################################################################################
######################          Bachelorseminar:          ######################
######################           Graphiken in R           ######################
######################                                    ######################
######################              ggplot2               ######################
######################             -Theorie-              ######################
################################################################################



#ggplot 2 ist ein Zusatzpacket in R, das zur Produktion von (statistischen)
#Graphiken benutzt werden kann. Besonders an diesem Packet ist, dass es Graphiken
#anhand einer ganz bestimmten Grammatik erzeugt. Diese zugrundeliegende Grammatik
#heiß "Grammar of Graphics". Sie soll dazu ermutigen, eine Graphik passend zu
#einer bestimmten Fragestellung zu wählen, anstatt sich auf allgemeine Graphiken
#zu verlassen.


install.packages("ggplot2") # installiert das Packet "gplot2". Durch
library("ggplot2") # wird das Packet dann geladen.

#In dem Packet "gplot2" existieren zwei Funktionen zum Erzeugen von Graphiken:
#qplot() und ggplot().  Beiden Funktionen kann man eine Vielzahl von Paramentern
#übergeben. Diese und weitere Informationen findet man in der Hilfe mit
?qplot #und
?ggplot #.
#Mit qplot() können komplexe Graphiken sehr leicht erzeugt werden. Obwohl die
#Funktion auf der "Grammar of Graphics" basiert, kann der Benutzer sie verwenden
#ohne die "Grammar of Graphics" tatsächlich zu beherrschen.
#Anders verhält es sich mit der Funktion ggplot(). Es ist aufwändiger sich
#ggplot() anzueignen, da zum einen die Syntax eine eher unbekannte Form hat und
#zum anderen, weil man die Grundzüge der "Grammar of Graphics" verstanden haben
#sollte. Dennoch hat die Funktion einige Vorteile gegenüber qplot(). Mit ggplot()
#kann eine deutlich größere Auswahl an Graphiken erzeugt werden und es können
#mehrere verschiedene Quelldaten kombiniert werden.
#Um ggplot() benutzen zu können muss man sich erst darüber klar werden, was ein
#Layer ist. Ein Layer (zu deutsch: Ebene, Schicht) besteht aus fünf Komponenten:
#Einem Datensatz (data), Abbildungen zwischen den Variablen und visuellen
#Merkmalen (aesthetic mappings), einem geometrischen Objekt (geom), einer
#Statistik (stat), und einer Positionseinstellung (position adjustment).
#Nur mit Hilfe eines extra hinzugefügten Layers können die Daten durch die
#Funktion qqplot() sichtbargemacht werden.
#(bei qplot() passiert das Zufügen eines Layers automatisch)


#Wie bereits erwähnt basiert das R-Packet ggplot2 auf der "Grammar of Graphics".
#Die "Grammar of Graphics" definiert eine Graphik als Abbildung von Daten auf
#bestimmte ästhetische Merkmale (Farbe, Form, Größe,...) von geometrischen
#Objekten. Außerdem bestimmt sie die einzelenen unabhängigen Komponenten,
#aus denen eine Graphik besteht:
#data, geoms, stats, scales, coord, faceting.

#Diese Komponenten werden im Folgenden anhand von Beispielen erläutert.
#Zur Erzeugung der folgenden Graphiken wird der Datensatz "mammals sleep" benutzt.
#Er kann geladen werden durch den Befehl
data("msleep") #. Eine Hilfe und die Variablenbeschreibung erhält man durch
?msleep #.



################################################################################
#                             Daten  (data)                                    #
################################################################################

#Gernerell stellt die "Grammar of Graphics" keine besonderen Anforderungen an
#die Daten, jedoch wird im Graphikpacket "ggplot2"  ein dataframe gefordert. Die
#Daten alleine können noch nicht abgebildet werden.

#Sowohl
qplot(data=msleep) # als auch
ggplot(msleep) # geben eine Fehlermeldung aus und sind somit nicht allgemein wie
#zum Beispiel die Funktion plot() ind "base", die automatisch vorgegebene
#Graphiken erstellt, wenn man ihr einen Datensatz übergibt.

#Um etwas abbilden zu können, müssen die gewünschten Variablen übergeben werden.
#Beispielsweise zwei stetige Variablen "awake" und "sleep_rem":
qplot(awake, sleep_rem, data=msleep) #bildet hier als default ein Streudiagramm
#ab.
#Um in die Funktion ggplot() die gewünschten Variablen einzufügen, müssen sie
#zuerst der Funktion aes() übergeben werden, die die Zuordnung der Varialen auf
#ästhetische Eigenschaften übernimmt. Dennoch kann mit
ggplot(msleep, aes(awake, sleep_rem)) #immer noch kein Plot gezeichnet werden,
#da ggplot() keinen Default-Layer hinzufügt.



################################################################################
#                       geometrische Objekte  (geoms)                          #
################################################################################

#Unter geometrische Objekten versteht man zum Beispiel Punkte, Linien, ein Text,
#Vielecke, usw. Die geometrischen Objekte bestimmen durch welche Art von Objekt
#die Daten abgebildet werden sollen. Sie führen also die Übersetzung des Graphen
#hin zu einer Graphik aus.
#Mit Hilfe der geoms kann fast jeder Plot erzeugt werden.

#Die Funktion qplot() hat bereits default geoms angegeben. Dies ist meist das
#geom "point". Man kann aber auch andere geoms mit dem Parameter geom="."
#angeben.

qplot(awake, sleep_rem, data=msleep, geom="smooth") 
#erstellt z.B. eine Glättungslinie
qplot(seq_along(sort(msleep$awake)), sort(msleep$awake), geom="step") 
#verbindet Beobachtungen durch Stufen 

#Um mit ggplot() geometrische Objekte erzeugen zu können muss man manuell einen 
#Layer einfügen.
#Das geschieht durch das Anfügen des Ausdrucks "+ layer()":
ggplot(msleep, aes(vore, sleep_total)) + layer(geom="boxplot")
#oder es können auch Abkürzungen benutzt werden:
ggplot(msleep, aes(vore, sleep_total)) + geom_boxplot()

#Anmerkung: Plots mit nur einem geom haben meist Spezifische Namen:
#+geom_boxplot() -> Boxplot
#+geom_point() -> Streudiagramm
#+geom_line() -> Liniendiagramm
#+geom_density() -> Dichtekurve
#usw. 



################################################################################
#                  ästhetische Abbildungen (aesthetics)                        #
################################################################################

#Aesthetics sind Zuweisungen, die beschreiben, wie Variablen auf visuelle 
#Merkmale abgebildet werden sollen. Das heißt, die Aesthetics bestimmen die 
#Gestalt der geoms. Dazu werden Eigenschaften benutzt, wie zum Beispiel Farbe, 
#Form, Größe, Transparenz usw. (Jedes geom kann aber nur eine begrenzte Anzahl 
#von aesthetics abbilden: 
#           Punkt -> Position, Farbe, Größe, Form
#           Balken -> Position, Farbe, Größe, Höhe, Breite, Füllfarbe)

#Um asthetics zu definieren, müssen sowohl mit qplot() als auch mit ggplot() 
#den gewünschten Eigenschaften die Variablen zugewiesen werden, die durch diese
#Eigenschaft dargestellt werden sollen.
qplot(awake, sleep_rem, colour=vore, data=msleep, geom="point")
#In dieser Abbildung sollen also die verschiedenen Ausprägungen der Variable 
#vore durch verschiedene Farben dargestellt werden. Zur Unterscheidung könnte
#man auch die Form der Punkte verändern:
qplot(awake, sleep_rem, shape=vore, data=msleep, geom="point")

#Für stetige Variablen könnte man zum Beispiel eine Farbskala verwenden um die
#Übergänge der Variablenausprägungen erkennbar zu machen:
ggplot(msleep, aes(awake, sleep_rem, colour=sleep_cycle)) + geom_point() 
#Die gleiche Graphik kann werzeugt werden, wenn man den Parameter direkt der 
#geom-Funktion übergibt:
ggplot(msleep, aes(awake, sleep_rem )) + geom_point(aes(colour=sleep_cycle)) 
#Anstatt Farben zu benutzen, wäre es auch möglich die Größe der Punkte zu 
#variieren:
ggplot(msleep, aes(awake, sleep_rem )) + geom_point(aes(size=sleep_cycle)) 

#Aesthetics können aber auch dazu benutzt werden um sogennantes "Overplotting"
#abzuschwächen. Im folgenden Beispiel liegen mehrere Datenpunkte übereinander. 
#Mit Hilfe des Parameters alpha kann sichtbar gemacht werden, wie viele Punkte 
#an einer Stelle aufeinander liegen. Setzt man alpha wie hier auf 1/2 bedeutet 
#das, dass mindestens 2 Datenpunkte auf genau der selben Stelle liegen mussen, 
#damit der Punkt maximale Farbsättigung hat. Wenn also eine einer Stelle nur 
#eine einzige Beobachtung läge, wäre der Punkt transparent.
ggplot(msleep,aes(conservation, bodywt)) + geom_point(alpha=I(1/5))



################################################################################
#                  statistische Transformationen (stats)                       #
################################################################################

#In einer Graphik können unter Anderem auch statistische Transformationen 
#enthalten sein. Wenn ein stat in einen Layer eingefügt wird, bedeutet das 
#konkret, dass bestimmte Variablen neu errechnet werden. Besipielsweise 
#berechnet die stat "boxplot" die Variablen width (Breite des Boxplots), 
#ymin (unterer Whisker), lower(unteres Quartil), middle (Median), upper (oberes
#Quartil), ymax(oberer Whisker). Diese neu berechneten Variablen werden 
#anschließend an den Datensatz angehängt. 

#ggplot2 bietet viele verschiedene stats an. Zum Beispiel   
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + stat_abline(slope=-2.6257, intercept=18.5365)
#kann eine Gerade mit einer bestimmten Steigung und einem bestimmten Intercept
#eingefügt werden.
#Oder man könnte eine Dichtekurve über ein Histogramm zeichnen:
ggplot(msleep, aes(sleep_total, ..density..)) + geom_histogram(fill="grey50") + stat_density(geom="line", colour="red")
#Wie man hier schon sehen kann, ist es möglich auf die Variablen, die durch die
#stats erzeugt werden, zuzugreifen. Und zwar mit der syntax "..variable..".
#Im letzten Beispiel wurde auf die neue Variable denisty zugegriffen um an der 
#y-Achse anstatt der absoluten Häufigkeiten die Dichte anzutragen.

#Die statistischen Transformationen hängen auch eng mit den geometrischen 
#Objekten zusammen: Jede stat hat ein zugewiesenes default-geom und umgekehrt.
#Das geom bar hat zum Beispiel die deafult-stat bin und andersherum.
#Das ist auch der Grund dafür, dass ein Graph abgebildet werden kann, obwohl ihm
#nicht explizit ein geom zugewiesen wurde, sondern nur eine stat.

#Der Aufruf
ggplot(msleep, aes(vore, sleep_cycle)) + stat_identity() 
#liefert dasselbe Ergebnis wie 
ggplot(msleep, aes(vore, sleep_cycle)) + geom_point() 
#das heißt, die stat identity und das geom point sind einander zugeordnet.
#Genauso wie die stat smooth und das geom smooth:
ggplot(msleep, aes(sleep_total, awake)) + geom_smooth()
ggplot(msleep, aes(sleep_total, awake)) + stat_smooth()



################################################################################
#                            Skalen (scales)                                   #
################################################################################

#Für jedes benutzte Aesthetic existiert eine Funktion scale, die die Werte aus 
#dem Datenraum gültigen Werten im Raum der Aesthetics zuweist. Somit 
#kontrollieren die Scales das Aussehen der geoms und zugehöriger Legenden.
#Scales sind außerdem dafür verantwortlich, dass die Legenden und Achsen
#gezeichnet werden. Legenden und Achsen werden zusammen Guides genannt und 
#stellen das Inverse der Scales dar. Nur mit Hilfe der Guides kann ein 
#Betrachter Informationen aus einer Graphik ablesen.

#Es gibt verschiedene Arten von Scales. Zum einen wäre da die Positionscales.
ggplot(msleep, aes(sleep_total, sleep_rem)) + geom_point()
#In dieser Abbildung wurden den Punkten bestimmte Positionen zugeordnet, die den
#Werten der Variablen sleep_total und sleep_rem entsprechen. Um die exakten 
#Werte aus der Graphik entnehmen zu können, muss man sich der x- und der y-Achse
#bedienen. Die beiden Achsen sind die Guides.
#Eine andere Art von Scales sind Farbskalen. Das folgende Beispiel liefert eine
#Farbskala, anhand derer die verschiedenen Gruppen der Variable vore 
#unterschieden werden. Als default dient der HCL-Farbraum.
ggplot(msleep, aes(awake,sleep_rem)) + geom_point(aes(colour=vore))
#Man könnte aber auch besipielsweise Farbpaletten von colourbrewer.org benutzen:
ggplot(msleep, aes(awake,sleep_rem,colour=vore)) + geom_point()+ scale_colour_brewer(palette="Set4")


#Die "Grammar of Graphics" sieht für die Skalierung drei Schritte vor:
#1. Die Transformation: 
#Noch vor den statistischen Transformationen können Variablen zum besipiel 
#quadriert oder logarithmiert werden. Dieser Schritt wird nur bei stetigen 
#Variablen durchgeführt. Er soll gewährleisten, dass zum Beispiel eine 
#Abbildung log(y)~log(x) genauso aussieht wie eine Abbildung y~x auf 
#logarithmierten Achsen:
ggplot(msleep, aes(log(brainwt), log(bodywt))) + geom_point()
ggplot(msleep, aes(brainwt, bodywt)) + geom_point()+ scale_x_log10() + scale_y_log10()
#2. Training:
#In diesem Schritt wird die Domain (Werte aus dem Datenraum) in Erfahrung 
#gebracht. Wenn man zum Beipiel eine Graphik erzeugt, die auf verschiedenen 
#Layern basiert oder die verschiedene Facetten beinhaltet, ist es wichtig alle 
#verwendeten Skalen zu kombinieren um eine Gesamtskala zu erstellen. Würde 
#dieser Schritt nicht stattfinden, wären alle Achsen und Legenden nur lokal 
#interpretierbar, da zu Anfang jedes scale auf jedem Datensatz individuell 
#ausgebildet wird.
#3. Mapping:
#In diesem letzten Schritt werden die Werte der Daten (also der benutzten 
#Variablen) auf die Werte der aesthetics abgebildet.



################################################################################
#                      Koordinatensystem (coord)                               #
################################################################################

#Das Hinzufügen des Koordinatensystems ist der finale Schritt. Hierbei wird 
#festgelegt wie die Koordinaten der Daten in die Ebene der Graphik übertragen 
#werden sollen. Im geläufigsten zweidimensionalen Koordinatensystem, dem 
#kartesischen werden eine horizontale und eine vertikale Position im 90° Winkel
#aufeinander gestellt.
#Im folgenden Beispiel wird jeweils die absolute Häufigkeit der Tiere angetragen,
#die eine bestimmte Ernährungsform haben.
ggplot(msleep, aes(vore)) + geom_histogram(binwidth=1, aes(fill=vore)) 
#Als default ist das kartesische Koordinatensystem angegeben.

#Man sollte vorsichtig sein, dass man das Koordinatensystem nicht mit den Skalen
#verwechselt. Die Skalen beeinflussen lediglich alle Positionsvariablen. Das 
#Koordinatensystem hingegen kontrolliert wie Achsen und Gitterlinien gezeichnet
#werden und es kann auch das Aussehen der geometrischen objekte verändern.
#In R können verschiedene Koordinatensysteme durch den Befehl "coord_...()"
#aufgerufen werden. Es wird einfach ein weiterer Layer angefügt.
ggplot(msleep, aes(factor(1),fill=factor(vore))) + geom_bar(binwidth=1) + coord_cartesian()
ggplot(msleep, aes(factor(1),fill=factor(vore))) + geom_bar(binwidth=1) + coord_polar()
ggplot(msleep, aes(factor(1),fill=factor(vore))) + geom_bar(binwidth=1) + coord_polar(theta="y")
#oder:
ggplot(msleep, aes(x = factor(vore))) +   geom_bar(width = 1, aes(fill = vore))
ggplot(msleep, aes(x = factor(vore))) +   geom_bar(width = 1, aes(fill = vore)) + coord_polar()
#oder:
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + geom_smooth()
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + geom_smooth() + coord_polar()



################################################################################
#                        Facettierung (faceting)                               #
################################################################################

#Optional ist es möglich eine Graphik zu facettieren. Das bedeutet, dass man 
#aus einem Datensatz Untergruppen erzeugt und für jede dieser Teilmengen 
#dieselbe Graphik erzeugt. Diese einzelnen Plots werden dann in einer Matrixform 
#abgebildet, damit ihre Anordnung einen Vergleich zwischen den abgebildeten 
#Untergruppen begündtigt. Dieses Vorgehen ist vorteilhaft, wenn untersucht 
#werden soll, ob sich bestimmte Muster über den ganzen Datensatz erstrecken, die
#Aesthetics aber nicht mehr ausreichen um verschiedene Teilmengen erkennen zu 
#können. 

#Um in ggplot2 einen Datensatz zu facettieren, muss ein neuer Layer eingefügt 
#werden. Diesem werden als Parameter die Variablen übergeben, nach denen 
#der Datensatz aufgespalten werden soll:
# mit + facet_grid(.~variable) werden die Gruppen spaltenweise angeordnet:
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + facet_grid(.~vore)
# mit + facet_grid(variable~.) reihenweise :
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + facet_grid(vore~.)

#Es ist auch möglich den Datensatz nach zwei Variablen zu spalten:
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + facet_grid(vore~conservation)
#Anmerkung: bei leeren Zellen, liegen für die gegebene Kombination keine 
#Beobachtungen vor.

#Eine andere Möglichkeit zur Facettierung bietet der Befehl facet_wrap(). 
#Anstatt eine Matrix wie facet_grid, erzeugt facet_wrap eine Schlange mit den 
#Abbildungen der einzelnen Untergruppen. Diese können vom Benutzer beliebig 
#angeordnet werden.
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + facet_wrap(~vore, ncol=3)
ggplot(msleep, aes(sleep_rem, awake)) + geom_point() + facet_wrap(~vore, nrow=1)



################################################################################
#                 Positionseinstellung (position adjustment)                   #
################################################################################

#Als letztes kann man noch die Position von Objekten verändern. Die position 
#adjustments befassen sich mit der Überlappung der geometrischen Objekte bei 
#diskreten Daten innerhalb eines Layers. Es gibt insgesamt vier verschiedene 
#Positionseinstellungen, die anhand der nächsten Beispiele dargestellt werden.
#"stack" stapelt sich überlappende Objekte aufeinander:
ggplot(msleep, aes(sleep_rem, fill=vore)) + geom_bar(binwidth=1, position="stack")
#"fill" stapelt sich überlappende Objekte aufeinander und skaliert sie auf 1:
ggplot(msleep, aes(sleep_rem, fill=vore)) + geom_bar(binwidth=1, position="fill")
#"dodge" sich überlappende Objekte werden nebeneinander dargstellt:
ggplot(msleep, aes(sleep_rem, fill=vore)) + geom_bar(binwidth=1, position="dodge")
#"jitter" bewirkt, dass sich überlappende Punkte ein wenig gestreut werden:
ggplot(msleep, aes(vore, sleep_total)) + geom_point( ) # ohne jitter
ggplot(msleep, aes(vore, sleep_total)) + geom_point( position="jitter") # mit jitter



################################################################################
#                          Graphiken aus dem Vortrag                           #
################################################################################



########################## Graphiken mit qplot #################################


#Streudiagramm:  bodywt ~ brainwt  
plot1 <- qplot(brainwt, #Übergabe der Variable an die x-Achse
               bodywt, #Übergabe der Variable an die y-Achse
               data=msleep, #Definition des Datensatzes
               colour=vore) #Einfügen einer dritten Variable  
plot1   # Zeichnen des Plots

#Streudiagramm:  bodywt ~ brainwt (logarithmiert)  
plot2 <- qplot(log(brainwt), log(bodywt), data=msleep, colour=vore)    #logarithmierte Variablen
plot2

plot2 + opts(panel.background=theme_blank(), #weißer Hintergrund
             axis.line=theme_segment(), # Achsen werden angezeigt
             panel.grid.major=theme_blank(), panel.grid.minor=theme_blank(), #Gitterlinien ausblenden 
             title = "bodywt ~ brainwt", plot.title=theme_text(size=15, face="bold")) # Titel anzeigen

plot3 <- qplot(brainwt, bodywt, data=msleep, log="xy", colour=vore)  # gleiches Diagramm wie oben aber mit logarithmierten Achsen
plot3 

plot4 <- qplot(sleep_rem,awake, data=msleep, facets=vore~.) #reihenweise facettiert nach vore 
plot4 + opts(legend.position="none") #Legende wird ausgeblendet
plot4 + geom_line() +   #ein weiterer Layer wird hinzgefügt
  opts(legend.position="none") #Legende wird ausgeblendet

plot5 <- qplot(brainwt,bodywt, data=msleep,log="xy", facets=.~vore)  #spaltenweise facettiert nach vore
plot5 + geom_point()

plot6 <- qplot(brainwt, bodywt, data=msleep, log="xy") # Streudiagramm ohne die Variable "vore"
plot6
last_plot()  + geom_smooth(se=F)  # mit Glättungslinie

plot7 <- qplot(brainwt, bodywt, data=msleep, log="xy")
plot7 + geom_point(aes(colour=vore, size=awake)) # mit weiteren Variablen vore(Farbe) und awake(Größe)
plot7 + geom_point(aes(shape=vore))  #mit weiterer Variable vore(Form)

#Histogramm: sleep_rem
plot8 <- qplot(sleep_rem, data = msleep, facets=vore~.)   #facettiert nach vore
plot8 + geom_bar(binwidth=0.5) +    #Klassenbreite auf 0,5 festgelegt
  opts(legend.position="none")



######################### Graphiken mit ggplot #################################



#Streudiagramm: sleep_rem ~ awake 
plot9 <- ggplot(msleep,     #Übergabe des Datensatzes
                aes(awake, sleep_rem))  #Übergabe der aesthetics, hier: Variablen der x-Achse und der y-Achse
plot9 #kann nicht ausgeführt werden, da die Funktion ggplot() keinen Layer automatisch hinzufügt
plot9  + geom_point() #der erste Layer wird übergeben                     
last_plot() +  geom_point(aes(colour=vore))  #mit vore als dritte Variable(Farbe)
plot9 + geom_point() + geom_smooth(se=F) # mit zusätzlicher Glättungslinie 
plot9 + geom_point(aes(shape=vore))  #mit vore als dritter Varible(Form)
plot9 + geom_point(aes(colour=vore, size=sleep_total))#mit vore (Farbe) und sleep_total(Grösse) als weitere Variablen


#Boxplot:   sleep_total ~ vore 
plot10 <- ggplot(msleep, aes(vore,sleep_total))  
plot10 + geom_boxplot() 
last_plot() + coord_flip() + opts(axis.title.y=theme_blank())  #Koordinatensystem drehen


#Tortendiagramm: order
msleepmin <- subset(msleep, ((msleep$order ==  "Carnivora" )|              #Teilmenge der variable "order" erstellen
                               (msleep$order == "Perissodactyla") | (msleep$order =="Soricomorpha") | 
                               (msleep$order == "Cingulata") | (msleep$order == "Lagomorpha")))

plot11 <- ggplot(msleepmin, aes(factor(1),fill=factor(order))) +geom_bar(width=1)  #als Balkendiagramm
plot11 + coord_polar(theta="y") + opts(axis.title.x=theme_blank(), axis.title.y=theme_blank()) #mit Polarkoordinaten
last_plot() + opts( legend.position="none") #Legende ausgeblendet


#Histogramm: sleep_total
plot12 <- ggplot(msleep, aes(sleep_total))
plot12 + geom_histogram(binwidth=1.5, fill="grey50") #Klassenbreite auf 1.5 festgelegt und Balkenfarbe auf "grey50"
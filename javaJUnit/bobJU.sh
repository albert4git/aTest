#!/bin/bash
STR="Hello World!"
echo $STR

#www.thegeekstuff.com

export CLASSPATH=.:$CLASSPATH.:junit-4.10.jar
javac  Summer.java Sumtester.java 
java org.junit.runner.JUnitCore Sumtester

javac HelloWorld.java
java  HelloWorld

###
#
export CLASSPATH=.:$CLASSPATH.:junit-4.10.jar
javac -classpath .:junit-4.10.jar Summer.java Sumtester.java 
java org.junit.runner.JUnitCore Sumtester

Javadoc Summer.java Sumtester.java
open /Applications/Safari.app/ ./index.html
open /Applications/Fiji.app/ 
#
### index.html
#
# java org.junit.runner.JUnitCore AddSubTest
java Summer
java Sumtester



i    = 1
ii   = 10
iii  = 100
iiii = 1000
-------------------------------
| 1 | tabl     | another field     |
| 2 | my table | yet another field |
| 1 | tabl     | another field     |
| 2 | my table | yet another field |
---------------------------

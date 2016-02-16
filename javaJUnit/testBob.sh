#!/bin/bash - 
#===============================================================================
#
#          FILE: testBob.sh
# 
#         USAGE: ./testBob.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 13.02.2016 22:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

export CLASSPATH=.:$CLASSPATH.:junit-4.10.jar
echo $CLASSPATH
echo $PATH
echo $BASH
echo $BASH_ENV
echo $HOME
echo $BASH_VERSION

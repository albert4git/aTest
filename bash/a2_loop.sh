#!/bin/bash
####################################################################
##
DATADIR=/Users/neuro/Desktop/aktuell/dani2/testData/site/subject/
FuncBACKUPFILES=output_func_folder
AnatBACKUPFILES=output_anat_folder
RawFOLDER=raw_data_folder

####################################################################
clear
echo "------------------a1_pre_prop-------START--------------------"
pwd


# Absolute path to this script. /home/user/bin/foo.sh
SCRIPT=$(readlink -f $0)
# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`dirname $SCRIPT`

clear
echo "-------------------- $SCRIPTPATH --"
pwd
####################################################################
##
cd $DATADIR$RawFOLDER/used_mph
j="0"
ls *.* > list
for i in `cat list`;
do
    j=$(($j+1))
    j_mod=$(($j % 2))
    echo "j: $j -- j_mod: $j_mod -- + i + --- $i ist";
        if [ $j_mod -eq 0 ]
        then
            cp $i ../$i 
        fi
        if [ $j_mod -eq 1 ]
        then
            cp $i ../$i 
        fi
    
done

# LIST="$(ls *.*)"
# for i in "$LIST"; do
#     echo " i ------------ $i ist"
# done


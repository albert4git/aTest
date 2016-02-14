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

# Absolute path this script is in. /home/user/bin
SCRIPTPATH=`pwd -P`

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

cd /Users/neuro/aTest/aTest/fiji/Fiji.app.oct.2013/Contents/MacOS
./ImageJ-macosx /Users/neuro/aTest/fatiProjectA/nifti_bsp/AtlasIE1-Targets2/crAtlas-IE1-R.nii








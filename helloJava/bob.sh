#!/bin/bash
STR="Hello World!"
echo $STR

#www.thegeekstuff.com

javac hello.java
java hello

javac helloW.java
java helloW


javac hello2W.java
java hello2W

javac Calculator.java
java  Calculator

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

pwd
cd ~/Downloads/Slicer3-3.6.3-2011-03-04-darwin-x86/lib/Slicer3/Modules/AtlasCreator
pwd
python atlascreator.py -i ~/aTest/fatiProjectA/nifti_bsp/stk/F2 -s ~/aTest/fatiProjectA/nifti_bsp/stk/F2nib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2ffOut/  --dynamic --meanIterations 5 -w -l "1 2 3 4"
python atlascreator.py -i ~/aTest/fatiProjectA/nifti_bsp/stk/t2Seq -s ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqNib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqOut  --dynamic --meanIterations 5 -w -l "1 2 3 4"



cd ~/Downloads/Slicer3-3.6.3-2011-03-04-darwin-x86/lib/Slicer3/Modules/AtlasCreator
pwd
python atlascreator.py --skipRegistration --transforms ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqOut --existingTemplate ~/aTest/fatiProjectA/nifti_bsp/stk/Atlas/crAtlas.nrrd -s ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqNib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqOut -l "3 4 5 6 7 8 9" --normalize --outputCast 3

# python atlascreator.py -i ~/aTest/fatiProjectA/nifti_bsp/stk/t2Seq -s ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqNib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2SeqOut  --dynamic --meanIterations 5 -w -l "1 2 3 4"
## python atlascreator.py -i ~/aTest/fatiProjectA/nifti_bsp/stk/F2 -s ~/aTest/fatiProjectA/nifti_bsp/stk/F2nib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2ffOut/  --dynamic --meanIterations 5 -w -l "1 2 3 4"
# python atlascreator.py -i ~/aTest/fatiProjectA/nifti_bsp/stk/a2 -s ~/aTest/fatiProjectA/nifti_bsp/stk/a2nib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2aOut  --dynamic --meanIterations 5 -w -l "1 2"
# python atlascreator.py -i ~/aTest/fatiProjectA/nifti_bsp/stk/F2 -s ~/aTest/fatiProjectA/nifti_bsp/stk/F2nib -o ~/aTest/fatiProjectA/nifti_bsp/stk/t2Out  --fixed 
# python atlascreator.py -i TestData/originals/ -s TestData/segmentations/ -o /tmp/acout
# python atlascreator.py --help

Examples:
-----------------------------------------------------------------------------------------------
1. Run fixed registration with the testdata:

python atlascreator.py -i TestData/originals/ -s TestData/segmentations/ -o /tmp/acout --fixed --template TestData/originals/case62.nrrd -w -l "3 4 5 6 7 8 9" --normalize

-----------------------------------------------------------------------------------------------
2. Run fixed registration with the testdata and use CMTK instead of BRAINSFit:

python atlascreator.py -i TestData/originals/ -s TestData/segmentations/ -o /tmp/acout --fixed --template TestData/originals/case62.nrrd -w -l "3 4 5 6 7 8 9" --normalize --cmtk

-----------------------------------------------------------------------------------------------
3. Run dynamic registration with the testdata:

python atlascreator.py -i TestData/originals/ -s TestData/segmentations/ -o /tmp/acout --dynamic --meanIterations 5 -w -l "3 4 5 6 7 8 9" --normalize

-----------------------------------------------------------------------------------------------
4. Run dynamic registration with the testdata on a cluster (scheduler command "qsub"):

python atlascreator.py -i TestData/originals/ -s TestData/segmentations/ -o /tmp/acout --dynamic --meanIterations 5 -w -l "3 4 5 6 7 8 9" --normalize --cluster --schedulerCommand "qsub -b y"

-----------------------------------------------------------------------------------------------
5. Use existing registrations and just re-sample

python atlascreator.py --skipRegistration --transforms /tmp/acout --existingTemplate TestData/segmentations/case62.nrrd -s TestData/segmentations/ -o /tmp/acout -l "3 4 5 6 7 8 9" --normalize --outputCast 3


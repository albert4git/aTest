#! /bin/sh
if [ $# -ne 1  ]
then echo "Usage: read.sh filename";
    exit 1;
fi

if [ ! -f $1  ]
then echo "File $1 doesn't exist";
    exit 1;
fi

while read line
do
      echo $line
  done < $1


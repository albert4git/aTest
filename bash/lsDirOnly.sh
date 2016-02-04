#!/bin/sh
# Shell script to find out all the directories under a directory and
#its subdirectories. This also takes into consideration those files
#or directories which have spaces or newlines in their names

DIR="."

function list_files()
{
    if !(test -d "$1")
    then echo $1; return;
    fi

    cd "$1"
    echo; echo `pwd`:; #Display Directory name
    for i in *
    do
        if test -d "$i" #if dictionary
        then
            echo "$i"; #Display Directory name
        fi
    done

    for i in *
    do
        if test -d "$i" #if dictionary
        then
            list_files "$i" #recursively list files
            cd ..
        fi
    done


}

if [ $# -eq 0  ]
then list_files .
    exit 0
fi

for i in $*
do
    DIR="$1"
    list_files "$DIR"
    shift 1 #To read next directory/file name
done

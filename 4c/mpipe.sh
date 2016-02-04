#!/bin/sh
# gcc -c test.c count.c
gcc -c pipe.c
#gcc -o npipe main.c count.o test.o
gcc -o npipe  pipe.o
#./count
./npipe

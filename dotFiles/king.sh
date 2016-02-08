#!/bin/bash
# ln -sf /full/path/to/parent/child/child ../child1
# ln -sf /full/path/to/parent/child/child ../child2
# To make a link to a file in another user's home directory:
# ln ~sandra/prog.c .



mv ~/.bashrc ~/1bashrc
ln -s ~/git/aTest/dotFiles/bashrc_color ~/.bashrc 

mv ~/.bashrc_help ~/1bashrc_help 
ln -s ~/git/aTest/dotFiles/bashrc_help_color ~/.bashrc_help 


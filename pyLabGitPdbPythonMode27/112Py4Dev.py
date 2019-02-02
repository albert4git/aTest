#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
import sys

# Create an object of type file
temp = open('temp.txt', 'w')

# Write output
for i in range(20):
    temp.write('%03d\n' % i)

temp.close()

temp = open('temp.txt')

# Write in terminal
for x in temp:
    # writing in sys.stdout sends
    # text to standard output
    sys.stdout.write(x)

temp.close()

#==========================================================

import os.path
import glob

# Shows a list of file names
# and their respective sizes
for arq in sorted(glob.glob('*.py')):
    print arq, os.path.getsize(arq)

#==========================================================
import csv

# Data
dt = (('temperatura', 15.0, 'C', '10:40', '2006-12-31'),
      ('peso', 42.5, 'kg', '10:45', '2006-12-31'))

# A writing routine which receives one object of type file
out = csv.writer(file('dt.csv', 'w'))

# Writing the tuples in file
out.writerows(dt)
#==========================================================
import csv

# The reading routine receives a file object
dt = csv.reader(file('dt.csv'))

# For each record in file, prints
for reg in dt:
    print reg
#==========================================================

import os
import sys
import platform


def uid():
    """
    uid() -> returns the current user identification
    or None if not possible to identify
    """

    # Ambient variables for each operating system
    us = {'Windows': 'USERNAME', 'Linux': 'USER'}

    u = us.get(platform.system())
    return os.environ.get(u)


print 'User:', uid()
print 'plataform:', platform.platform()
print 'Current dir:', os.path.abspath(os.curdir)
exep, exef = os.path.split(sys.executable)
print 'Executable:', exef
print 'Executable dir:', exep

##==========================================================
#import sys
#from subprocess import Popen, PIPE
## ping
#cmd = 'ping -c 1 '
## No Windows
#if sys.platform == 'win32':
#    cmd = 'ping -n 1 '
## Local just for testing
#host = '127.0.0.1'
## Comunicates with another process
## a pipe with the command stdout
#py = Popen(cmd + host, stdout=PIPE)
## Shows command output
#print py.stdout.read()

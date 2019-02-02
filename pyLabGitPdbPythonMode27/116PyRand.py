#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
import random

# Creates a file with 25 random numbers
with file('temp.txt', 'w') as temp:
    for y in range(5):
        for x in range(5):
            # "print >> " records command output on the file
            print >> temp, '%.2f' % random.random(),
        print >> temp

# Shows file content
with file('temp.txt') as temp:
    for i in temp:
        print i,

# Out of the blocks, the file will be closed
# The following command generates an exception ValueError: I/O operation on closed file
print >> temp



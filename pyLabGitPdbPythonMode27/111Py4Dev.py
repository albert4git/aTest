#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#=============================================================
# For i on the list 234, 654, 378, 798:
for i in [234, 654, 378, 798]:
    # If the remainder dividing by 3 is equal to zero:
    if i % 3 == 0:
        # Prints...
        print i, '/ 3 =', i / 3

#=======temperature value used to test =======================
temp = 23

if temp < 0:
    print 'Freezing...'
elif 0 <= temp <= 20:
    print 'Cold'
elif 21 <= temp <= 25:
    print 'Normal'
elif 26 <= temp <= 35:
    print 'Hot'
else:
    print 'Very Hot!'

#======Sum 0 to 99 ===========================================
s = 0
x = 1

while x < 100:
    s = s + x
    x = x + 1
print s

#======Sum 0 to 99 ===========================================
s = 0
for x in range(1, 100):
    s = s + x
print s

#======Fatorial implemented with recursion===================


def factorial(num):

    if num <= 1:
        return 1
    else:
        return (num * factorial(num - 1))


# Testing factorial()
print factorial(5)


#=============================================================
def fib(n):
    """Fibonacci:
    fib(n) = fib(n - 1) + fib(n - 2) se n > 1
    fib(n) = 1 se n <= 1
    """
    if n > 1:
        return fib(n - 1) + fib(n - 2)
    else:
        return 1


# Show Fibonacci from 1 to 5
for i in [1, 2, 3, 4, 5]:
    print i, '=>', fib(i)


#=============================================================
def func(*args, **kargs):
    print args
    print kargs


func('weigh', 10, unit='k')

#=============================================================
data = [(4, 3), (5, 1), (7, 2), (9, 0)]


# Comparing by the last element
def _cmp(x, y):
    return cmp(x[-1], y[-1])


print 'List:', data

# Ordering using  _cmp()
print 'Ordered:', sorted(data, _cmp)
#=============================================================
print eval('12. / 2 + 3.3')

#=============================================================
# To use PyDOC in Linux:
# pydoc ./modulo.py
# To show the documentation of modulo.py in the current directory.
# In Linux, the documentation of libraries can be seen throught the
# browser by using:
# pydoc -p 8000
# At the address http://localhost:8000/. To run the graphical version of PyDOC type:
# pydoc -g

#=============================================================
import os
print os.name

#=============================================================
# from os import name
# print name
# # Imports calc module
# import calc
# l = [23, 54, 31, 77, 12, 34]
# # Calls the function defined in calc
# print calc.average(l)
#=============================================================
#=============================================================
import os.path
import sys
import glob


def find(txt):
    """find modules with name containing the parameter
    """

    resp = []

    for path in sys.path:
        mods = glob.glob('%s/*.py' % path)

        print 'mods:', mods

        for mod in mods:
            if txt in os.path.basename(mod):
                resp.append(mod)

    return resp


print 'resp:', resp

#=============================================================
from os.path import getsize, getmtime
from time import localtime, asctime
import modutils
mods = modutils.find('xml')

for mod in mods:

    tm = asctime(localtime(getmtime(mod)))
    kb = getsize(mod) / 1024
    print '%s: (%d kbytes, %s)' % (mod, kb, tm)
#=============================================================
from os.path import getsize, getmtime
from time import localtime, asctime


def addlist(list):
    """
    Add lists of lists, recursively
    the result is global
    """
    global add

    for item in list:
        if type(item) is list:  # If item type is list
            addlist(item)
        else:
            #add += item
            print item


add = 0
addlist([[1, 2], [3, 4, 5], 6])

#=============================================================
import math

import cmath

# Complex
for cpx in [3j, 1.5 + 1j, -2 - 2j]:

    # Polar coordinate conversion
    plr = cmath.polar(cpx)
    print 'Complex:', cpx
    print 'Polar:', plr, '(in radians)'
    print 'Amplitude:', abs(cpx)
    print 'Angle:', math.degrees(plr[1]), '(grades)'
#=============================================================
import random
import string

# Choose a letter
print random.choice(string.ascii_uppercase)

# Choose a number from 1 to 10
print random.randrange(1, 11)

# Choose a float from 0 to 1
print random.random()
#=============================================================
from fractions import Fraction

# Three fractions
f1 = Fraction('-2/3')
f2 = Fraction(3, 4)
f3 = Fraction('.25')
print "Fraction('-2/3') =", f1
print "Fraction('3, 4') =", f2
print "Fraction('.25') =", f3

# Sum
print f1, '+', f2, '=', f1 + f2
print f2, '+', f3, '=', f2 + f3

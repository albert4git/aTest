#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""

import numpy as np
from numpy import *
a = np.arange(0, 1, 0.1).reshape((5, 2))
print a

b = a.ravel()
print b
a = np.zeros((2, 2))
print a
b = np.ones((2, 2))
print b

c = np.vstack((a, b))
print c

d = np.hstack((a, b))
print d

#-------------------------------------------------------------
import numpy.fft
import math
a = [(-1)**n for n in xrange(8)]
print a
b = numpy.fft.fft(a)
print b
#-------------------------------------------------------------
import numpy
from numpy import *
a = arange(12)
a = a.reshape(3, 4)
print a
print '---------------------------------'
a = numpy.zeros((3, 3))
print a
print '---------------------------------'
b = numpy.zeros((3, 3), dtype=int)
print b
print '---------------------------------'
b = numpy.identity(3)
print b
print '---------------------------------'
a = numpy.matrix('1 0;0 1')
b = numpy.matrix('1 2;3 4')
print '---------------------------------'
print a
print '---------------------------------'
print b
print '---------------------------------'
print(a * b)
print '---------------------------------'
print(b.T)
print '---------------------------------'
print(b.I)
print '---------------------------------'
#-------------------------------------------------------------
from numpy import matrix
from numpy import linalg
A = matrix([[1, 2, 3], [11, 12, 13], [21, 22, 23]])  # Creates a matrix.
x = matrix([[1], [2], [3]])  # Creates a matrix (like a column vector).
y = matrix([[1, 2, 3]])  # Creates a matrix (like a row vector).
print linalg.solve(A, x)  # Solve the linear equation

#-------------------------------------------------------------
print A.T  # Transpose of A.
print A * x  # Matrix multiplication of A and x.
print A.I  # Inverse of A.
print linalg.solve(A, x)  # Solve the linear equation
#-------------------------------------------------------------
from sympy import *
from pylab import *
from numpy import *
M = Matrix([[1, 0], [0, 1]])
print M
print M.shape
Z = zeros((3, 4))
print Z
#--------------------------------------
O = ones((3, 4))
print O
#---------------------------------------
x = Symbol('x')
y = Symbol('y')
A = Matrix([[1, x], [y, 1]])
print A
#---------------------------------------
L = linspace(0, 2, 9)
#---------------------------------------
li = linspace(0, 2 * pi, 100)
f = sin(li)
#---------------------------------------
rr = random.random((2, 3))
print rr
#-------------------------------------------------------------

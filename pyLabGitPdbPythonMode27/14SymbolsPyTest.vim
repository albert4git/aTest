#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""

import sympy
from pylab import *
from numpy import *
from sympy import *
from sympy.stats import *

mu = Matrix([5, 13])
Sigma = Matrix([[2, 0], [0, 2]])
X = Normal('X', mu, Sigma)
y = MatrixSymbol('y', 2, 1)
density(X)(y)
#---NotOK----------------------------------------------------------

import sympy
from sympy import *
from pylab import *
from numpy import *
from sympy.statistics.distributions import Sample
s = Sample([1, 2, 3, 4, 5])
sympy.pprint(s.mean)
sympy.pprint(s.stddev)
sympy.pprint(s.median)
sympy.pprint(s.variance)

#--OK-----------------------------------------------------------
import sympy
import statistics
from sympy import *
from pylab import *
from numpy import *
from sympy.stats import DiscreteUniform, E
X = DiscreteUniform("X", [1, 2, 3])
sympy.pprint(E(X))

#-------------------------------------------------------------

import sympy
from sympy import *
from sympy.statistics import *
import sys
sys.displayhook = pprint
N = Normal(0, 1)
N.mean

#-------------------------------------------------------------
import sympy
from sympy import *
from pylab import *
from numpy import *
from sympy import Symbol, exp, I
x = Symbol("x")
a = Symbol("a")
b = Symbol("b")
sympy.pprint(pi)
pi
sympy.pprint(Symbol('#'))

print '-------------------------------------------------------'
sympy.pprint(exp(I * x).expand(complex=True))
#-------------------------------------------------------------
print '-------------------------------------------------------'
x = Symbol("x", real=True)
sympy.pprint(exp(I * x).expand(complex=True))
print '-------------------------------------------------------'
pretty(expr), pretty_print(expr), pprint(expr)

#============================================================
import sympy
from sympy import *
from sympy.matrices import Matrix
x = Symbol('x')
y = Symbol('y')
z = Symbol('z')
A = Matrix([[x, 1, 1], [1, y, 1], [1, 1, z]])
sympy.pprint(A)
print '-------------------------------------------------------'
sympy.pprint(A**2)
#============================================================

#============================================================

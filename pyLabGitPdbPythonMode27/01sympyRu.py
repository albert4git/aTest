#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""

#------------------------------------------------------------
#--readthedocs--XXX0--SetUp-----------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
z = Symbol('z')
m = Symbol('m')
n = Symbol('n')
a = Symbol('a')
b = Symbol('b')
c = Symbol('c')
f = symbols('f', cls=Function)
g = symbols('g', cls=Function)
a = x + y
b = y * z
print("a={}. b={}.".format(a, b))
print '-------------------------------------------------------'
f = sympy.sin(x)**2 + sympy.cos(x)**2
sympy.pprint(f)
print '-------------------------------------------------------'
sympy.pprint(f.simplify())
print '-------------------------------------------------------'
g = sympy.cosh(x)**2 - sympy.sinh(x)**2
sympy.pprint(g)
print '-------------------------------------------------------'
sympy.pprint(g.simplify())

#--readthedocs--XXX1--Solve--4REPL---------------------------------
import sympy
from sympy import *
a, b, c, x = sympy.symbols(('a', 'b', 'c', 'x'))
z = Symbol('z')
quadratic_equation = sympy.Eq(a * x**2 + b * x + c, 0)
sympy.pprint(quadratic_equation)

print '-------------------------------------------------------'
sympy.pprint(sympy.solve(quadratic_equation))
print '-------------------------------------------------------'
sympy.pprint(sympy.solve(quadratic_equation, x))
print '-------------------------------------------------------'
roots = sympy.solve(quadratic_equation, x)
xplus, xminus = sympy.symbols(('x_{+}', 'x_{-}'))
xplus = roots[0]
xminus = roots[1]
sympy.pprint(xplus)
sympy.pprint(xminus)
print '-------------------------------------------------------'
xplus_solution = xplus.subs([(a, 1), (b, 2), (c, 3)])
sympy.pprint(xplus_solution)
print '-------------------------------------------------------'
xminus_solution = xminus.subs([(b, a), (c, a + z)])
sympy.pprint(xminus_solution)
print '-------------------------------------------------------'

#--readthedocs--XXX2--Solve-----------------------------------
import sympy
from sympy import *
a, b, c, x = sympy.symbols(('a', 'b', 'c', 'x'))
g = symbols('g', cls=Function)
z = Symbol('z')
y = Symbol('y')
n = Symbol('n')
q = Symbol('q')

eq1 = Symbol('eq1')
eq2 = Symbol('eq2')

print '-------------------------------------------------------'
eq1 = sympy.Eq(x + 2 * y, 0)
sympy.pprint(eq1)
sympy.pprint(eq2)
eq2 = sympy.Eq(x * y, z)

q = sympy.solve([eq1, eq2], [x, y])
sympy.pprint(q)
print '-------------------------------------------------------'

#-------------------------------------------------------------
from sympy import *
print 'EAT ME'
print "Hens", 25 + 30 / 6
a = Rational(1, 2)
x = 2
y = 3
x = Symbol('x')
y = Symbol('y')
print "I said x: %r." % x
print "I also said y: '%s'." % y
print "I said Py: %r." % pi.evalf()
print "Pi + e : %r " % (pi + exp(1)).evalf()

#-------------------------------------------------------------
from sympy import *
x = Symbol('x')
y = Symbol('y')
print x + y + x - y
print(x + y)**2
print expand((x + y)**3)
print expand(x + y, complex=True)
print expand(cos(x + y), trig=True)
print simplify((x + x * y) / x)

#-------------------------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
print(sin(2 * x))
pprint(sin(2 * x))

print diff(sin(2 * x), x, 2)
print diff(sin(2 * x), x, 3)
print integrate(6 * x**5, x)
print integrate(sin(x), x)
print integrate(log(x), x)
print integrate(2 * x + sinh(x), x)
print integrate(exp(-x**2) * erf(x), x)

#-------------------------------------------------------------
#It is possible to compute definite integral:
from sympy import *
x = Symbol('x')
y = Symbol('y')
print integrate(x**3, (x, -1, 1))
print integrate(sin(x), (x, 0, pi / 2))
print integrate(cos(x), (x, -pi / 2, pi / 2))

#-------------------------------------------------------------
#Also improper integrals are supported as well:
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
print integrate(exp(-x), (x, 0, oo))
print integrate(exp(-x**2), (x, -oo, oo))

#-------------------------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
print solve(x**4 - 1, x)
print solve([x + 5 * y - 2, -3 * x + 6 * y - 15], [x, y])

f = x**4 - 3 * x**2 + 1
print f
print '-------------------------------------------------------'
sympy.pprint(f)
print '-------------------------------------------------------'
print factor(f)
print '-------------------------------------------------------'
sympy.pprint(factor(f))
print '-------------------------------------------------------'
print factor(f, modulus=5)
print '-------------------------------------------------------'
print satisfiable(x & y)

#-------------------------------------------------------------
import sympy
from sympy import *
x = Symbol('x')

y = Symbol('y')
sympy.pprint(simplify((x + x * y) / x))

#=============================================================


#------------------------------------------------------------------------------
def fib(n):  # write Fibonacci series up to n
    a, b = 0, 1
    while b < n:
        print b
        a, b = b, a + b


# Now call the function we just defined:
fib(200)

#------------------------------------------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
sympy.pprint(expand((x + y)**3))
print '-------------------------------------------------------'
sympy.pprint(expand(cos(x + y)))
print '-------------------------------------------------------'
sympy.pprint(expand(cos(x + y), trig=True))
print '-------------------------------------------------------'
sympy.pprint(simplify((x + x * y) / x))
print '-------------------------------------------------------'
sympy.pprint(limit(1 / x, x, oo))
print '-------------------------------------------------------'
sympy.pprint(limit(sin(x), x, oo))
print '-------------------------------------------------------'
sympy.pprint(limit(sin(x) / x, x, 0))
print '-------------------------------------------------------'
sympy.pprint(diff(sin(2 * x), x))
print '-------------------------------------------------------'
sympy.pprint(diff(sin(2 * x), x, 3))

#-------------------RuWorks!------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
print '-------------------------------------------------------'
sympy.pprint(integrate(6 * x**5, x))
print '-------------------------------------------------------'
sympy.pprint(integrate(log(x), x))
print '-------------------------------------------------------'
sympy.pprint(integrate(exp(-x**2) * erf(x), x))
print '-------------------------------------------------------'
sympy.pprint(integrate(sin(x), (x, 0, pi / 2)))
print '-------------------------------------------------------'
sympy.pprint(integrate(exp(-x**2), (x, -oo, oo)))
print '-------------------------------------------------------'
sympy.pprint(solve([x + 5 * y - 2, -3 * x + 6 * y - 15], [x, y]))

#-------------------RuCircle------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
print '-------------------------------------------------------'
f = (exp(-x**2 - y**2))
sympy.pprint(f)
print '-------------------------------------------------------'
sympy.pprint(integrate(f, (x, -oo, oo), (y, -oo, oo)))
print '-------------------------------------------------------'
f = sin(x) + cos(y)
sympy.pprint(f)
print '-------------------------------------------------------'
print f.subs({x: 1, y: 2})
print '-------------------------------------------------------'
print f.subs({x: 1, y: 2}).n()

#--------------Ru-----------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
print '-------------------------------------------------------'
f = x**4 - 3 * x**2 + 1
sympy.pprint(f)
print '-------------------------------------------------------'
sympy.pprint(factor(f))
print '-------------------------------------------------------'
print '-------------------------------------------------------'
sympy.pprint(solve(f, [x, y]))
print '-------------------------------------------------------'

#--------------RuDerive----------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
print '-----------------------------------------------'
expr = y**2 * 3 * x
print '-----------------------------------------------'
sympy.pprint(expr)
print '-----------------------------------------------'
sympy.pprint(expr.args)
print '-----------------------------------------------'
deriv = Derivative(expr, x, y, 3)
sympy.pprint(deriv)
print '-----------------------------------------------'

#-------------------------------------------------------------
from numpy import *
O = ones((3, 4))
print O
#-------------------------------------------------------------
from sympy import *
from pylab import *
from numpy import *
x = Symbol('x')
y = Symbol('y')
A = Matrix([[1, x], [y, 1]])
print A
#-------------------------------------------------------------
L = linspace(0, 2, 9)
#-------------------------------------------------------------
li = linspace(0, 2 * pi, 100)
f = sin(li)
#-------------------------------------------------------------
rr = random.random((2, 3))
print rr
#-------------------------------------------------------------
from numpy import matrix
from numpy import linalg
A = matrix([[1, 2, 3], [11, 12, 13], [21, 22, 23]])  # Creates a matrix.
x = matrix([[1], [2], [3]])  # Creates a matrix (like a column vector).
y = matrix([[1, 2, 3]])  # Creates a matrix (like a row vector).
print linalg.solve(A, x)  # Solve the linear equation

#-----------------RuFactor------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
f = 2 * x + 3 * x - sin(x) - 3 * x + 42
sympy.pprint(f)
print '-------------------------------------------------------'
sympy.pprint((x**2 - 2 * x - 8))
sympy.pprint(factor(x**2 - 2 * x - 8))
print '-------------------------------------------------------'
sympy.pprint(((x - 4) * (x + 2)))
sympy.pprint(expand((x - 4) * (x + 2)))
print '-------------------------------------------------------'

#-----------------RuLambertW--------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
print '-------------------------------------------------------'
print([sin(x + y), cos(x - y)], [x, y])
sympy.pprint(solve([sin(x + y), cos(x - y)], [x, y]))
print '-------------------------------------------------------'
print([x**2 - y**2 / exp(x)], [x, y])
sympy.pprint(solve([x**2 - y**2 / exp(x)], [x, y]))

#-----------------RuLambertW--------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
a = Symbol('a')
b = Symbol('b')
c = Symbol('c')
m = Symbol('m')
n = Symbol('n')
print '-------------------------------------------------------'
sympy.pprint(n**x)
print '-------------------------------------------------------'
sympy.pprint((1 + 1 / n)**n)
print '-------------------------------------------------------'
sympy.pprint(limit((1 + 1 / n)**n, n, oo))

#--------------Ru-exp-!!!-e---------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
sympy.pprint((exp(-x**2 - y**2)))
print '-------------------------------------------------------'
sympy.pprint((-x**2 - y**2))
print '-------------------------------------------------------'
sympy.pprint(integrate(exp(-x**2 - y**2), (x, -oo, oo), (y, -oo, oo)))
print '-------------------------------------------------------'
sympy.pprint(integrate((-x**2 - y**2), (x, -oo, oo), (y, -oo, oo)))

#----------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
print(1 / cos(x)).series(x, 0, 10)
#? print f(x).diff(x, x) + f(x)

#-----------JustPrint------------------------------------------
from sympy import *
f = symbols('f', cls=Function)
x = Symbol('x')
y = Symbol('y')
print '-------------------------------------------------------'
print f(x).diff(x, x) + f(x)
print '-------------------------------------------------------'
print dsolve(f(x).diff(x, x) + f(x), f(x))
print '-------------------------------------------------------'

#from __future__ import division
#import sympy
#from sympy import *
#from sympy import init_session
##init_session() # doctest: +SKIP
#x, y, z, t = symbols('x y z t')
#k, m, n = symbols('k m n', integer=True)
#f, g, h = symbols('f g h', cls=Function)
#init_printing()  # doctest: +SKIP
#print '-------------------------------------------------------'
#pprint(Integral(sqrt(1 / x), x), use_unicode=False)
#print '-------------------------------------------------------'
##pprint(Integral(sqrt(1/x), x), use_unicode=True)
#print '-------------------------------------------------------'
#g = (x**x, x)
#sympy.pprint(g)
#print '-------------------------------------------------------'
#sympy.pprint(integrate(g))
#print '-------------------------------------------------------'
#sympy.pprint(Integral(g))

#--------------RuIntegral-----------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
m = Symbol('m')
n = Symbol('n')
a = Symbol('a')
b = Symbol('b')
c = Symbol('c')
f = symbols('f', cls=Function)
g = symbols('g', cls=Function)
print '-------------------------------------------------------'
g = (x**x, x)
sympy.pprint(g)
print '-------------------------------------------------------'
sympy.pprint(integrate(g))
print '-------------------------------------------------------'
sympy.pprint(Integral(g))
print '-------------------------------------------------------'
f = (a * x + b)**m
print '-------------------------------------------------------'
sympy.pprint(f)
print '-------------------------------------------------------'
sympy.pprint(a * x**2 + b * x + c)
print '-------------------------------------------------------'
sympy.pprint(solve(a * x**2 + b * x + c, x))

#--------------Ru-----------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
f = symbols('f', cls=Function)
print '-------------------------------------------------------'
diffeq = Eq(f(x).diff(x, x) - 2 * f(x).diff(x) + f(x), sin(x))
print '-------------------------------------------------------'
sympy.pprint(diffeq)
print '-------------------------------------------------------'
sympy.pprint(dsolve(diffeq, f(x)))
print '-------------------------------------------------------'

print '---------------------------------'
sympy.pprint(f(x).diff(x))
print '---------------------------------'
sympy.pprint(dsolve(f(x) - diff(f(x), x), f(x)))
print '---------------------------------'
sympy.pprint(dsolve(f(x).diff(x, x) + f(x), f(x)))
print '---------------------------------'
print '---------------------------------'
sympy.pprint(Integral(x**2, x))
print '---------------------------------'
sympy.pprint(x + x + y * y + 1)
print '---------------------------------'
sympy.pprint(1 / cos(x))
print '---------------------------------'
sympy.pprint(f(x).diff(x, x) + f(x))
print '---------------------------------'
sympy.pprint(dsolve(f(x).diff(x, x) + f(x), f(x)))
print '---------------------------------'

#---abc?-------------------------------------------
from sympy import Integral, preview
from sympy.abc import x
preview(Integral(x**2, x))
#----------------------------------------------

#-------------------------------------------------------------
import sympy
#x, y = sympy.symbols ('xy')
x = sympy.Symbol('x')
y = sympy.Symbol('y')
sympy.var('x y')
print '---------------------------------'
print(x + x + y * y + 1)
print '---------------------------------'
sympy.pprint(x + x + y * y + 1)
print '---------------------------------'
sympy.pprint(sympy.Integral(x**2, x))
print '---------------------------------'
sympy.pprint(sympy.chebyshevt(4, x))
print '---------------------------------'
a = sympy.Rational(1, 2)
sympy.pprint(a)
print '---------------------------------'
sympy.pprint(a + 1)
print '---------------------------------'
r = sympy.Symbol('r')
circle = sympy.Circle(sympy.Point(0, 0), r)
sympy.pprint(circle.area)

#-------------------------------------------------------------
import numpy
from numpy import *
A = numpy.matrix('1 0;0 1')
B = numpy.matrix('1 2;3 4')
print '---------------------------------'
print A
print '---------------------------------'
print B
print '---------------------------------'
print(A * B)
print '---------------------------------'
print(B.T)
print '---------------------------------'
print(B.I)
print '---------------------------------'

#----------------RuMatrix.Identity--------------------------------------
import numpy
from numpy import *
A = arange(12)
A = A.reshape(3, 4)
print A
print '---------------------------------'
B = numpy.zeros((3, 3))
print B
print '---------------------------------'
C = numpy.zeros((3, 3), dtype=int)
print C
print '---------------------------------'
D = numpy.identity(3)
print D

#-------------------------------------------------------------
import sympy
from sympy import *
from pylab import *
from numpy import *

x = Symbol('x')
y = Symbol('y')
a = Symbol('a')
r = Symbol('r')
theta = Symbol('theta')

x = cos(theta)
y = sin(theta)
dx = diff(x)
dy = diff(y)
result = int(x * dy - y * dx, theta, 0, 2 * pi)
sympy.pprint(result)

#----------------RuMatrix2---------------------------------------------
import sympy
from sympy import *
from pylab import *
from numpy import *
x = Symbol('x')
y = Symbol('y')
A = Matrix([[1, x], [y, 1]])
print '-----------------------------------------------'
sympy.pprint(A)
print '-----------------------------------------------'
sympy.pprint(A**2)
print '-----------------------------------------------'
sympy.pprint(A.T)  # Transpose of A.
print '-----------------------------------------------'
sympy.pprint(A * x)  # Matrix multiplication of A and x.
print '-----------------------------------------------'
M = Matrix([[1, 0], [0, 1]])
sympy.pprint(M)
print '-----------------------------------------------'
Z = zeros((4, 4))
sympy.pprint(Z)

#-----ErrPart???-------------------------------------------------
sympy.pprint(linalg.solve(A, x))  # Solve the linear equation
print '-----------------------------------------------'
sympy.pprint(A.I)  # Inverse of A.

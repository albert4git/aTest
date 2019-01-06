#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#-SymPy--------------------------------------------------------------
#--------------------------------------------------------------------
import sympy
x = sympy.Symbol('x')
y = sympy.Symbol('y')
#------------------------------------------
z = (x + y)**2
#------------------------------------------
sympy.pprint(z)
sympy.pprint(z.expand())
#------------------------------------------
z = 1 / ((x + 2) * (x + 1))
#------------------------------------------
sympy.pprint(z)
sympy.pprint(sympy.apart(z, x))

#-SymPy-
import sympy
r = sympy.Symbol('r')
circle = sympy.Circle(sympy.Point(0, 0), r)
sympy.pprint(circle.area)

#--------------------------------------------------------------------
#--------------------------------------------------------------------
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
#-------------------------------------------------------------

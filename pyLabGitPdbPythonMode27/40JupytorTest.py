#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""
jupyter notebook
http://localhost:8888/tree
http://localhost:8888/tree/SymbolicPython-ipynb
"""

import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
sympy.pprint(expand((x + y)**3))
print('-------------------------------------------------------')
sympy.pprint(expand(cos(x + y)))
print('-------------------------------------------------------')
sympy.pprint(expand(cos(x + y), trig=True))

#--Err-----------------------------------------------------------
import sympy
from sympy import *
x = Symbol('x')
y = Symbol('y')
z = Symbol('z')
a = Symbol('a')
r = Symbol('r')
f = symbols('f', cls=Function)
print '-------------------------------------------------------'
print diff(x**5, x, 3)
print '======================================================='
expr = cos(x)
print(expr)
print '------------------------------------------------------'
print(diff(expr, x))
print '======================================================='
expr = exp(x * y * z)
sympy.pprint(expr)
print '------------------------------------------------------'
ex1 = diff(expr, x, y, y, z, z, z, z)
sympy.pprint(ex1)
print '******************************************************'
deriv = Derivative(expr, x, y, y, z, 4)
sympy.pprint(deriv)
print '------------------------------------------------------'
dirDot = deriv.doit()
sympy.pprint(dirDot)
print '======================================================='
inter = integrate(cos(x) + sin(3 * x), x)
sympy.pprint(inter)
print '*******************************************************'

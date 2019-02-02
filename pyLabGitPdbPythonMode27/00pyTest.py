#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""

#-------------------------------------------------------------
import sympy
from sympy import symbols, Function
import sympy.functions as sym
from sympy import init_printing
init_printing(use_latex=True)
from sympy import pprint
from sympy import Symbol

x = Symbol('x')

# However I would like to control what to print in a function,
# so that multiple expressions can be printed from a single notebook cell.
pprint((1 + x)**2)

#from IPython.display import display
#from PIL import Image

#path = "./annotate.jpg"
#display(Image.open(path))

##-------------------------------------------------------------
#from sympy import symbols, cos
#from sympy.plotting import plot3d
#x, y = symbols('x y')
#plot3d(cos(x * 3) * cos(y * 5) - y, (x, -1, 1), (y, -1, 1))
#show()

#-------------------------------------------------------------
#-------------------------------------------------------------

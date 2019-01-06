#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#--------LinAlgebra------------------------------------------------
from scipy import linalg as la

#-------------------------------------------------------------

#--NoImage------------------------------------------------------------
import Image
im = Image.open("lena.ppm")
print im.format, im.size, im.mode
im.show()

#---NotWorking---------------------------------------
from sympy import *
from pylab import *
import numpy as np
from matplotlib import pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
n = 100
tol = .0001
U = np.ones((n, n))
U[:, 0] = 100  # sets west boundary condition
U[:, -1] = 100  # sets east boundary condition
U[0] = 0  # sets north boundary condition
U[-1] = 0  # sets south boundary condition
# U has been changed in place (note that laplace is the name of
# the function in this case).
laplace(U, tol)
x = np.linspace(0, 1, n)
y = np.linspace(0, 1, n)
X, Y = np.meshgrid(x, y)
fig = plt.figure()
ax = fig.gca(projection=' 3d ')
ax.plot_surface(X, Y, U, rstride=5)
plt.show()

#-------------------------------------------------------------
#----------Arrow-----------------------------------------
import pylab as pl
import numpy as np
pl.figure(figsize=(4, 4))
pl.title('pylab.arrow, square ratio')
z = np.arange(10)
pl.plot(z, z, 'ro')
pl.arrow(2, 2, 3, 4, head_width=0.5, head_length=1)
pl.show()

#-------------------------------------------------------------
import pylab as pl
import numpy as np
x = np.arange(0.1, 1000, 0.1)
y = np.log(x)
pl.figure(figsize=(6, 4))
pl.title('pylab.arrow, different axis scale')
pl.plot(x, y, 'b-')
pl.arrow(400, 2, 200, 3, head_width=0.5, head_length=1)
pl.arrow(200, 2, 300, 4, head_width=0.5, head_length=100)
pl.ylim(ymin=0)
pl.show()

#---------------Anotate-Arrow---------------------------------------------
import pylab as pl
import numpy as np
x = np.arange(0.1, 1000, 0.1)
y = np.log(x)
pl.figure(figsize=(6, 4))
pl.plot(x, y, 'b-')
pl.title('pylab.annotate example')
pl.annotate('Label', xy = (500, np.log(500)), xytext=(300,1),\
                arrowprops=dict(facecolor='red', width=0.5,\
                                    headwidth=10, shrink=0.05),\
                ha='center', va='baseline', fontsize='large')
pl.show()

#---NotWorking-NoSympyPlot---------------------------------------------------------
import sympy
from sympy import *
x = sympy.Symbol('x')
y = sympy.Symbol('y')
sympy.Plot(x**2 + y**2)
show()

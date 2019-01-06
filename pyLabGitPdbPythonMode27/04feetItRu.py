#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#=============================================================================
#----Linear-Data-Feeting-------------------------------------------------------
import numpy as np
import matplotlib.pyplot as plt
from pylab import *


def func(x, a, b):
    return a * x + b


x = linspace(0, 10, 100)
y = func(x, 1, 2)
yn = y + 0.9 * np.random.normal(size=len(x))
from scipy.optimize import curve_fit
popt, pcov = curve_fit(func, x, yn)
print(popt)
print(pcov)
perr = np.sqrt(np.diag(pcov))
xlabel(r'$x$')
ylabel(r'$y$')
ylim(-4, 14)
plot(x, yn, 'kx')
#---------------------------------------------------
#fit1 = r"fit with: $a={0:.3f}\pm{2:.3f}$, \
# 		    $b={1:.3f}\pm{3:.3f}$".format(*popt, *perr)
#label=fit1,
#---------------------------------------------------
# here we create a string that contains the fit parameters
# and their corresponding standard errors
# we use that string as a label in the plot
plot(x, func(x, *popt), lw=3)
plot(x, y, label='original function', c='r')
legend(loc=8)
show()
#=============================================================================
#----Linear-Data-Feeting-------------------------------------------------------
import numpy as np
import matplotlib.pyplot as plt
from pylab import *


def func(x, a, b):
    return a * x + b


x = linspace(0, 10, 100)
y = func(x, 1, 2)
yn = y + 0.9 * np.random.normal(size=len(x))
coeff = polyfit(x, yn, 1)
print(coeff)
popt3, pcov3 = polyfit(x, yn, 1, cov=True)
print(popt3)
print(pcov3)
perr3 = np.sqrt(np.diag(pcov3))
xlabel(r'$x$')
ylabel(r'$y$')
ylim(-4, 14)
title(r"Linear fit example for $y=f(x)=ax+b$")
#fit1 = r"curve\_fit with: $a={:.3f}\pm{:.3f}$, \
# $b={:.3f}\pm{:.3f}$".format(popt[0], perr[0], popt[1], perr[1])
plot(x, yn, 'gs')
plot(x, func(x, *coeff), lw=2, c='b')
plot(x, func(x, *popt3), lw=2, c='k')
plot(x, y, label=r'original function: $a=1$, $b=2$', c='r')
legend(loc=8)
show()

#=======PolifeetQuadratNice====================================================
import numpy as np
import matplotlib.pyplot as plt
from pylab import *


def gauss(x, a, b, c):
    return a * exp(-(x - b)**2 / (2 * c**2))


# Generate data and and random noise to it
x2 = linspace(0, 10, 100)
y2 = gauss(x2, 1, 5, 2)
yn2 = y2 + 0.2 * np.random.normal(size=len(x2))
#Plot the noisy data
xlabel(r'$x$')
ylabel(r'$y$')
from scipy.optimize import curve_fit
popt2, pcov2 = curve_fit(gauss, x2, yn2)
perr2 = np.sqrt(np.diag(pcov2))
ylim(0.6, 1.5)
xlabel(r'$x$')
ylabel(r'$y$')
plot(x2, gauss(x2, *popt2), c='r', lw=3)
plot(x2, y2, c='g', label='original function')
legend(loc=8)
plot(x2, yn2, 'bo')
show()

#-----LinRegression01---------------------------------------------------------
from numpy import arange, array, ones  #,random,linalg
from pylab import plot, show
from scipy import stats

xi = arange(0, 9)
A = array([xi, ones(9)])
# linearly generated sequence
y = [19, 20, 20.5, 21.5, 22, 23, 23, 25.5, 24]

slope, intercept, r_value, p_value, std_err = stats.linregress(xi, y)

print 'r value', r_value
print 'p_value', p_value
print 'standard deviation', std_err

line = slope * xi + intercept
plot(xi, line, 'r-', xi, y, 'o')
show()

#=======PoliffetBellRed========================================================
import numpy as np
import matplotlib.pyplot as plt
from pylab import *


def func(x, a, b):
    return a * x + b


def gauss(x, a, b, c):
    return a * exp(-(x - b)**2 / (2 * c**2))


x = linspace(0, 10, 100)
y = gauss(x, 1, 5, 2)
yn = y + 0.2 * np.random.normal(size=len(x))
coeff = polyfit(x, yn, 1)
print(coeff)
popt3, pcov3 = polyfit(x, yn, 1, cov=True)
print(popt3)
print(pcov3)
perr3 = np.sqrt(np.diag(pcov3))
xlabel(r'$x$')
ylabel(r'$y$')
ylim(-4, 14)
title(r"Linear fit example for $y=f(x)=ax+b$")
#fit1 = r"curve\_fit with: $a={:.3f}\pm{:.3f}$, \
# $b={:.3f}\pm{:.3f}$".format(popt[0], perr[0], popt[1], perr[1])
plot(x, yn, 'gs')
plot(x, func(x, *coeff), lw=2, c='b')
plot(x, func(x, *popt3), lw=2, c='k')
plot(x, y, label=r'original function: $a=1$, $b=2$', c='r')
legend(loc=8)
plt.ylim(-1, 1)
show()
#------------------------------------------------------------------------------

#-------------------------------------------------------------
print 'EAT ME'
#-------------------------------------------------------------

#-------------------------------------------------------------
from sympy import *
#Limits are easy to use in SymPy,
#they follow the syntax limit(function, variable, point),
#f(x) as x -> 0, you would issue limit(f, x, 0):
print limit(sin(x) / x, x, 0)
print limit(1 / x, x, oo)
print limit(x**x, x, 0)

#-------------------------------------------------------------
# Higher derivatives can be calculated using the diff(func, var, n) method:
print diff(sin(x), x)
print diff(sin(2 * x), x)
print diff(tan(x), x)
print limit((tan(x + y) - tan(x)) / y, y, 0)
#-------------------------------------------------------------
print diff(sin(2 * x), x, 1)
print diff(sin(2 * x), x, 2)
print diff(sin(2 * x), x, 3)
print integrate(6 * x**5, x)
print integrate(sin(x), x)
print integrate(log(x), x)
print integrate(2 * x + sinh(x), x)
print integrate(exp(-x**2) * erf(x), x)

#-------------------------------------------------------------
#It is possible to compute definite integral:
print integrate(x**3, (x, -1, 1))
print integrate(sin(x), (x, 0, pi / 2))
print integrate(cos(x), (x, -pi / 2, pi / 2))

#-------------------------------------------------------------
#Also improper integrals are supported as well:
print integrate(exp(-x), (x, 0, oo))
print integrate(exp(-x**2), (x, -oo, oo))
print solve(x**4 - 1, x)
print solve([x + 5 * y - 2, -3 * x + 6 * y - 15], [x, y])
f = x**4 - 3 * x**2 + 1
print f
print factor(f)
print factor(f, modulus=5)
print satisfiable(x & y)

#-------------------------------------------------------------
import numpy
import pylab
# Build a vector of 10000 normal deviates with variance 0.5^2 and mean 2
mu, sigma = 2, 0.5
v = numpy.random.normal(mu, sigma, 10000)
# Plot a normalized histogram with 50 bins
pylab.hist(v, bins=50, normed=1)  # matplotlib version (plot)
pylab.show()
# Compute the histogram with numpy and then plot it
(n, bins) = numpy.histogram(v, bins=50, normed=1)  # NumPy version (no plot)
pylab.plot(bins, n)
pylab.show()

#---------Works!----------------------------
from pylab import *


def plot2d(xmin, xmax, func):
    x = np.linspace(xmin, xmax, num=50)
    y = func(x)
    plot(x, y)
    show()


def func(x):
    y = x**2
    return y


plot2d(0, 10, func)

#------------------------------------------------------
import numpy as np
import matplotlib.pyplot as plt
# evenly sampled time at 200ms intervals
t = np.arange(0., 5., 0.2)
# red dashes, blue squares and green triangles
plt.plot(t, t, 'r--', t, t**2, 'bs', t, t**3, 'g^')
plt.show()
#------------------------------------------------------

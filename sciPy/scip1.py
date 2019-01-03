
x = 1
if x == 1:
    print "x is 1."

    print "I will now count my chickens:"
    print "Hens", 25 + 30 / 6
    print "Roosters", 100 - 25 * 3 % 4

print "Now I will count the eggs:"
print 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

print "Is it greater?", 5 > -2
print "Is it greater or equal?", 5 >= -2
print "Is it less or equal?", 5 <= -2

x = "There are %d types of people." % 10
binary = "binary"
do_not = "don't"
y = "Those who know %s and those who %s." % (binary, do_not)

print x
print y

print "I said: %r." % x
print "I also said: '%s'." % y

hilarious = False
joke_evaluation = "Isn't that joke so funny?! %r"

print joke_evaluation % hilarious

w = "This is the left side of..."
e = "a string with a right side."

print w + e
#--------------------------------------"
formatter = "%r %r %r %r"

print formatter % (1, 2, 3, 4)
print formatter % ("one", "two", "three", "four")
print formatter % (True, False, False, True)
print formatter % (formatter, formatter, formatter, formatter)
print formatter % (
    "I had this thing.",
    "That you could type up right.",
    "But it didn't sing.",
    "So I said goodnight."
)
#--------------------------------------"
#--------------------------------------"
#--------------------------------------"
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."

fat_cat = """
I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
"""

print tabby_cat
print persian_cat
print backslash_cat
print fat_cat
#--------------------------------------"
# Here's some new strange stuff, remember type it exactly.

days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"

print "Here are the days: ", days
print "Here are the months: ", months

print """
There's something going on here.
With the three double-quotes.
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
"""
#--------------------------------------"
print "How old are you?",
age = raw_input()
print "How tall are you?",
height = raw_input()
print "How much do you weigh?",
weight = raw_input()
print "So, you're %r old, %r tall and %r heavy." % (
    age, height, weight)
#--------------------------------------"
print 'EAT ME'

#--------------------------------------"
from sympy import *
print "Hens", 25 + 30 / 6
a = Rational(1,2)
x = 2;
y = 3;
x = Symbol('x')
y = Symbol('y')
print "I said x: %r." % x
print "I also said y: '%s'." % y
print "I said Py: %r." % pi.evalf()
print "Pi + e : %r " % (pi+exp(1)).evalf()

# print
print x+y+x-y
print (x+y)**2
print expand((x+y)**3)
print expand(x+y, complex=True)
print expand(cos(x+y), trig=True)
print simplify((x+x*y)/x)


#Limits are easy to use in SymPy,
#they follow the syntax limit(function, variable, point),
#f(x) as x -> 0, you would issue limit(f, x, 0):
print limit(sin(x)/x, x, 0)
print limit(1/x, x, oo)
print limit(x**x, x, 0)

# Higher derivatives can be calculated using the diff(func, var, n) method:
print diff(sin(x), x)
print diff(sin(2*x), x)
print diff(tan(x), x)
print limit((tan(x+y)-tan(x))/y, y, 0)
#
print diff(sin(2*x), x, 1)
print diff(sin(2*x), x, 2)
print diff(sin(2*x), x, 3)
print integrate(6*x**5, x)
print integrate(sin(x), x)
print integrate(log(x), x)
print integrate(2*x + sinh(x), x)
print integrate(exp(-x**2)*erf(x), x)
#It is possible to compute definite integral:
print integrate(x**3, (x, -1, 1))
print integrate(sin(x), (x, 0, pi/2))
print integrate(cos(x), (x, -pi/2, pi/2))
#Also improper integrals are supported as well:
print integrate(exp(-x), (x, 0, oo))
print integrate(exp(-x**2), (x, -oo, oo))
print solve(x**4 - 1, x)
print solve([x + 5*y - 2, -3*x + 6*y - 15], [x, y])
f = x**4 - 3*x**2 + 1
print f
print factor(f)
print factor(f, modulus=5)
print satisfiable(x & y)
#--------------------------------------"
#--------------------------------------"
from sympy import *
from pylab import *
from numpy import *
M = Matrix([[1,0], [0,1]])
print M
print M.shape
Z= zeros( (3,4) )
print Z
#---------
O = ones( (3,4) )
print O
#---------
x = Symbol('x')
y = Symbol('y')
A = Matrix([[1,x], [y,1]])
print A
#---------
L = linspace( 0, 2, 9 )
#---------
li = linspace( 0, 2*pi, 100 )
f = sin(li)
#---------
rr = random.random((2,3))
print rr
#---------
from numpy import matrix
from numpy import linalg
A = matrix( [[1,2,3],[11,12,13],[21,22,23]]) # Creates a matrix.
x = matrix( [[1],[2],[3]] ) # Creates a matrix (like a column vector).
y = matrix( [[1,2,3]] ) # Creates a matrix (like a row vector).
print linalg.solve(A, x) # Solve the linear equation

print A.T # Transpose of A.
print A*x # Matrix multiplication of A and x.
print A.I # Inverse of A.
print linalg.solve(A, x) # Solve the linear equation
#---------
import numpy
import pylab
# Build a vector of 10000 normal deviates with variance 0.5^2 and mean 2
mu, sigma = 2, 0.5
v = numpy.random.normal(mu,sigma,10000)
# Plot a normalized histogram with 50 bins
pylab.hist(v, bins=50, normed=1) # matplotlib version (plot)
pylab.show()
# Compute the histogram with numpy and then plot it
(n, bins) = numpy.histogram(v, bins=50, normed=1) # NumPy version (no plot)
pylab.plot(bins, n)
pylab.show()

#---------Works!----------------------------
from pylab import *

def plot2d(xmin, xmax, func):
    x=np.linspace(xmin,xmax,num=50)
    y=func(x)
    plot(x,y)
    show()

def func(x):
    y=x**2
    return y
plot2d(0,10,func)

#----------------------------------------------
from sympy import *
x = Symbol('x')
y = Symbol('y')
print f(x).diff(x, x) + f(x)
print dsolve(f(x).diff(x, x) + f(x), f(x))

#----------------------------------------------
from sympy import *
x = Symbol('x')
print (1/cos(x)).series(x, 0, 10)
#? print f(x).diff(x, x) + f(x)
#----------------------------------------------
from sympy import Integral, preview
from sympy.abc import x
preview(Integral(x**2, x))

#------------------------------------------------------
from sympy.printing.python import python
from sympy import Integral
from sympy.abc import x
print python(x**2)
print python(1/x)
print python(Integral(x**2, x))
#------------------------------------------------------
def fib(n): # write Fibonacci series up to n
    a, b = 0, 1
    while b < n:
	print b; a, b = b, a+b;
# Now call the function we just defined:
fib(200)
#------------------------------------------------------
import numpy as np
import matplotlib.pyplot as plt
# evenly sampled time at 200ms intervals
t = np.arange(0., 5., 0.2)
# red dashes, blue squares and green triangles
plt.plot(t, t, 'r--', t, t**2, 'bs', t, t**3, 'g^')
#------------------------------------------------------






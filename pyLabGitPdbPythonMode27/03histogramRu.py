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
import numpy
import pylab
#Bld a vector of 10000 normal deviates with variance 0.5^2 and mean 2
mu, sigma = 2, 0.5
v = numpy.random.normal(mu, sigma, 10000)
# Plot a normalized histogram with 50 bins
pylab.hist(v, bins=50, normed=1)  # matplotlib version (plot)
pylab.show()
# Compute the histogram with numpy and then plot it
(n, bins) = numpy.histogram(v, bins=50, normed=1)  # NumPy version (no plot)
pylab.plot(bins, n)
pylab.show()

#-------------IQ-GausBell-------------------------------------
import numpy
import matplotlib.pyplot as plt
mu, sigma = 100, 15
x = mu + sigma * numpy.random.randn(10000)
# the histogram of the data
n, bins, patches = plt.hist(x, 50, density=1, facecolor='g', alpha=0.75)
plt.xlabel('Smarts')
plt.ylabel('Probability')
plt.title('Histogram of IQ')
plt.text(60, .025, r'$\mu=100,\ \sigma=15$')
plt.axis([40, 160, 0, 0.03])
plt.grid(True)
plt.show()

#-----------SineAndHist-------------------------------------------
import numpy as np
import matplotlib.pyplot as plt
fig = plt.figure()
fig.subplots_adjust(top=0.8)
ax1 = fig.add_subplot(211)
ax1.set_ylabel('volts')
ax1.set_title('a sine wave')
t = np.arange(0.0, 1.0, 0.01)
s = np.sin(2 * np.pi * t)
line, = ax1.plot(t, s, color='blue', lw=2)
# Fixing random state for reproducibility
np.random.seed(19680801)
ax2 = fig.add_axes([0.15, 0.1, 0.7, 0.3])
n, bins, patches = ax2.hist(
    np.random.randn(1000), 50, facecolor='yellow', edgecolor='yellow')
ax2.set_xlabel('time (s)')
plt.show()

#-------------------------------------------------------------
#-----4SubPlots---------------------------------------------
import matplotlib.pyplot as plt
import numpy as np
np.random.seed(19680801)
data = np.random.randn(2, 100)
fig, axs = plt.subplots(2, 2, figsize=(5, 5))
axs[0, 0].hist(data[0])
axs[1, 0].scatter(data[0], data[1])
axs[0, 1].plot(data[0], data[1])
axs[1, 1].hist2d(data[0], data[1])
plt.show()

#-------------------------------------------------------------

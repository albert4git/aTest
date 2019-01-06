#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""

#----------SinePlusCosine------------------------------------------------------
import pylab
import numpy as np
x = np.arange(0, 6 * np.pi, 0.01)
y = np.sin(x) * np.cos(3 * x)
pylab.plot(x, y)
pylab.grid()
pylab.show()

#--------ZigZagErrTiks-----------------------------------------
from pylab import *
# define some data
x = [1, 2, 3, 4]
y = [20, 21, 20.5, 20.8]
# error data
y_error = [0.12, 0.13, 0.2, 0.1]
# just as before we plot our data
plot(x, y, linestyle='dashed', marker='o', color='red')
# and the we plot the errorbars separately
errorbar(x, y, yerr=y_error, linestyle="None", marker="None", color="red")
xlim(0.5, 4.5)
ylim(19.8, 21.2)
# now let us manipulate the axes ticks
xticks([1, 2, 3, 4])
yticks([20, 21, 20.5, 20.8])
# and set labels
xlabel(r"This is $x$")
ylabel(r"This is $y$")
title("My beautiful plot")
show()
#--------------------------------------------------------------

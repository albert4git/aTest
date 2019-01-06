#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#=============================================================
#-----------Save--Write--Anotate-------------------------------
import matplotlib.pyplot as plt
import numpy as np
from IPython.display import display
from PIL import Image
ax = plt.subplot(111)
t = np.arange(0.0, 5.0, 0.01)
s = np.cos(2 * np.pi * t)
line, = plt.plot(t, s, lw=2)
plt.annotate(
    'local max',
    xy=(2, 1),
    xytext=(3, 1.5),
    arrowprops=dict(facecolor='black', shrink=0.05),
)
plt.ylim(-2, 2)
plt.grid(True)
plt.savefig('annotate.jpg')
plt.show()
#-------------NiceQ--PillowAnotateShow()---------------------------
from PIL import Image
path = "./annotate.png"
print path
img = Image.open(path)
img.show()

#---------------Anotate-NoShow()-------------------------------
import matplotlib.pyplot as plt
import numpy as np
from IPython.display import display as dsp
from PIL import Image
path = "./annotate.jpg"
dsp.display(Image.open(path))
dsp.show()

#---------------MatplotAnotateShow()----------------------------------
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
path = "./annotate.png"
print path
plt.imshow(mpimg.imread(path))
plt.show()

#=============================================================

#--------------Nice-Double-SinnFadeOf-------------------------------
import matplotlib.pyplot as plt
from pylab import *


def f(t):
    return np.exp(-t) * np.cos(2 * np.pi * t)


t1 = np.arange(0.0, 5.0, 0.1)
t2 = np.arange(0.0, 5.0, 0.02)
plt.figure(1)
plt.subplot(211)
plt.plot(t1, f(t1), 'bo', t2, f(t2), 'k')
plt.subplot(212)
plt.plot(t2, np.cos(2 * np.pi * t2), 'r--')
plt.show()
#-------------------------------------------------------------
#-------------------------------------------------------------

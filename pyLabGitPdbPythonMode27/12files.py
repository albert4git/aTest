#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""

#==============================================================
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
#-------------NiceQ--PillowAnotateShow()-----------------------
from PIL import Image
path = "./annotate.png"
print path
img = Image.open(path)
img.show()

#=============================================================
import pickle
import numpy as np
fname = "testArray.p"
array_original = np.array([[1, 2, 3], [4, 5, 6]])
#---------------------
print array_original
#---------------------
pickle.dump(array_original, open(fname, "wb"))
array_deserialize = pickle.load(open(fname, "rb"))
#---------------------
print(array_original == array_deserialize)
#---------------------
print(array_deserialize)
#---------------------
pickle.dump({"name": "kevin"}, open("testDict.pkl", "wb"))
dogs_dict = {'Ozzy': 3, 'Filou': 8, 'Luna': 5}
pickle.dump(dogs_dict, open("testDict.pkl", "wb"))
dogsd = pickle.load(open("testDict.pkl", "rb"))
#---------------------
print(dogsd)
#---------------------
data1 = {'a': [1, 2.0, 3, 4 + 6j], 'b': ('string', '2string'), 'c': None}
pickle.dump(data1, open("testDict.pkl", "wb"))
data1L = pickle.load(open("testDict.pkl", "rb"))
#---------------------
print(load1L)
#---------------------

#=============================================================

import numpy as np
from numpy import *
x = y = z = np.arange(0.0, 5.0, 1.0)

print x
print y
print z

np.savetxt('test.out', x, delimiter=',')  # X is an array
np.savetxt('test.out', (x, y, z))  # x,y,z equal sized 1D arrays
np.savetxt('test.out', x, fmt='%1.4e')  # use exponential notation
#=============================================================

#=============================================================

import numpy as np
from numpy import *
fname = "testFileSave.p"
#-------------------------------------------------------------
a = np.arange(5)
np.save(fname, a)
print '---------------------------------'
b = np.arange(0, 1, 0.1).reshape((5, 2))
print b
np.save(fname, b)
print '---------------------------------'

import numpy as np
from numpy import *
g = np.load(fname)
print g
#-------------------------------------------------------------

import cPickle
import numpy as np


class my_data(object):
    pass


data1 = my_data()
data1.data = np.random.randn(100)
data1.params = {"sigma": 1., "mu": 0.}
fname = "testCpick.p"
cPickle.dump(data1, file(fname, 'w'))
data2 = cPickle.load(file(fname))

#import pickle
#??? pickle.loads

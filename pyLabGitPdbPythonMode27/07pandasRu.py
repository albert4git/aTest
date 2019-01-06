#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2018 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#-Pandas-???--------------------------------------------------------------
import pylab
import numpy as np
import pandas as pd
x = np.arange(0, 6 * np.pi, 0.01)
y = np.sin(x) * np.cos(3 * x)
series = pd.Series(y, index=x)
subseries = series[np.pi / 2:np.pi]
subseries.plot()
pylab.show()

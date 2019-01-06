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
import numpy as np
import matplotlib.pyplot as plt

x = np.concatenate((np.random.normal(loc=-2, scale=.5, size=500),
                    np.random.normal(loc=2, scale=.5, size=500)))

plt.hist(x, normed=True)
plt.xlim([-5, 5])
plt.show()

#--No???Sklearn------------------------------------------------
import numpy as np
import matplotlib.pyplot as plt
from sklearn.ensemble import IsolationForest

isolation_forest = IsolationForest(n_estimators=100)
isolation_forest.fit(x.reshape(-1, 1))

xx = np.linspace(-6, 6, 100).reshape(-1, 1)
anomaly_score = isolation_forest.decision_function(xx)
outlier = isolation_forest.predict(xx)

plt.plot(xx, anomaly_score, label='anomaly score')
plt.fill_between(
    xx.T[0],
    np.min(anomaly_score),
    np.max(anomaly_score),
    where=outlier == -1,
    color='r',
    alpha=.4,
    label='outlier region')
plt.legend()
plt.ylabel('anomaly score')
plt.xlabel('x')
plt.xlim([-5, 5])
plt.show()
#-------------------------------------------------------------
#-------------------------------------------------------------
#-------------------------------------------------------------

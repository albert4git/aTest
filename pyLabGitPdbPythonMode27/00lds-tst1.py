#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""
http://localhost:8888/tree/git/pix6-pyLabLink/19-LearnDataScience-739a002/notebooks
"""

import matplotlib.pyplot as plt
import numpy as np
from pylab import *
import pandas as pd
# we have to clean up the raw data set which we will do
# in the next lesson. But for now let's look at the cleaned up data.
# import the cleaned up dataset into a pandas data frame
df = pd.read_csv('datasets/loanf.csv')

# extract FICO Score and Interest Rate and plot them
# FICO Score on x-axis, Interest Rate on y-axis
intrate = df['Interest.Rate']
fico = df['FICO.Score']
p = plt.plot(fico, intrate, 'o')
ax = gca()
xt = ax.set_xlabel('FICO Score')
yt = ax.set_ylabel('Interest Rate %')
show()

#===========================================================
import matplotlib.pyplot as plt
import pandas as pd
from pylab import *
plt.figure()
loansmin = pd.read_csv('datasets/loanf.csv')
fico = loansmin['FICO.Score']
p = fico.hist()
show()

#===========================================================
import matplotlib.pyplot as plt
import pandas as pd
from pylab import *
plt.figure()
loansmin = pd.read_csv('datasets/loanf.csv')

p = loansmin.boxplot('Interest.Rate', 'FICO.Score')
q = p.set_xticklabels([
    '640', '', '', '', '660', '', '', '', '680', '', '', '', '700', '720', '',
    '', '', '740', '', '', '', '760', '', '', '', '780', '', '', '', '800', '',
    '', '', '820', '', '', '', '840'
])

q0 = p.set_xlabel('FICO Score')
q1 = p.set_ylabel('Interest Rate %')
show()

#===========================================================
## TRY THIS!
from pylab import *
import pandas as pd
loansmin = pd.read_csv('datasets/loanf.csv')
a = pd.scatter_matrix(loansmin, alpha=0.05, figsize=(10, 10), diagonal='hist')
show()

#===========================================================
"""
http://localhost:8888/notebooks/git/pix6-pyLabLink/19-LearnDataScience-739a002/notebooks/A3.%20Linear%20Regression%20-%20Analysis.ipynb
"""
import pylab as pl
import numpy as np
#from sklearn import datasets, linear_model
import pandas as pd
import statsmodels.api as sm

# import the cleaned up dataset
df = pd.read_csv('datasets/loanf.csv')

intrate = df['Interest.Rate']
loanamt = df['Loan.Amount']
fico = df['FICO.Score']

# reshape the data from a pandas Series to columns
# the dependent variable
y = np.matrix(intrate).transpose()
# the independent variables shaped as columns
x1 = np.matrix(fico).transpose()
x2 = np.matrix(loanamt).transpose()

# put the two columns together to create an input matrix
# if we had n independent variables we would have n columns here
x = np.column_stack([x1, x2])

# create a linear model and fit it to the data
X = sm.add_constant(x)
model = sm.OLS(y, X)
f = model.fit()

print 'Coefficients: ', f.params[0:2]
print 'Intercept: ', f.params[2]
print 'P-Values: ', f.pvalues
print 'R-Squared: ', f.rsquared

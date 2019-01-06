#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""
- ??? -
"""


#==========================================================
def square(x):
    """square a number"""
    return x**2


for N in range(1, 4):
    print(N, "squared is", square(N))

#==========================================================
import numpy as np
s = np.random.poisson(5, 10000)
import matplotlib.pyplot as plt
count, bins, ignored = plt.hist(s, 14, density=True)
plt.show()

#===ERR=======================================================
import numpy
from pandas import read_csv
from sklearn.decomposition import PCA
# load data
url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv"
names = [
    'preg', 'plas', 'pres', 'skin', 'test', 'mass', 'pedi', 'age', 'class'
]
dataframe = read_csv(url, names=names)
array = dataframe.values
X = array[:, 0:8]
Y = array[:, 8]
# feature extraction
pca = PCA(n_components=3)
fit = pca.fit(X)
# summarize components
print("Explained Variance: %s") % fit.explained_variance_ratio_
print(fit.components_)

#===ERR=======================================================
import matplotlib.pyplot as plt
plt.style.use('classic')
import numpy as np
import pandas as pd
import seaborn as sns
df = sns.load_dataset('iris')

# plot of 2 variables
p1 = sns.kdeplot(df['sepal_width'], shade=True, color="r")
p1 = sns.kdeplot(df['sepal_length'], shade=True, color="b")
sns.plt.show()

#--Seaborn-OK--ERR---------------------------------------------------------
import matplotlib.pyplot as plt
plt.style.use('classic')
import numpy as np
import pandas as pd
import seaborn as sns

data = np.random.multivariate_normal([0, 0], [[5, 2], [2, 2]], size=2000)
data = pd.dataframe(data, columns=['x', 'y'])

for col in 'xy':
    plt.hist(data[col], normed=True, alpha=0.5)

#sns.kdeplot(data)

plt.show()

#--seaborn-ok--ERR---------------------------------------------------------
import matplotlib.pyplot as plt
plt.style.use('classic')
import numpy as np
import pandas as pd

data = np.random.multivariate_normal([0, 0], [[5, 2], [2, 2]], size=2000)
data = pd.dataframe(data, columns=['x', 'y'])

# for col in 'xy':
#     plt.hist(data[col], normed=True, alpha=0.5)

#--Seaborn-OK-----------------------------------------------------------
import seaborn as sns
sns.set()

#--Seaborn-OK-----------------------------------------------------------
for col in 'xy':
    sns.kdeplot(data[col], shade=True)
    sns.distplot(data['x'])
    sns.distplot(data['y'])
#--Seaborn-OK-----------------------------------------------------------

plt.show()

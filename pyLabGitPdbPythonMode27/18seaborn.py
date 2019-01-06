#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#--Seaborn-OK-----------------------------------------------------------
# Import the necessary libraries
import matplotlib.pyplot as plt
import pandas as pd

# Initialize Figure and Axes object
fig, ax = plt.subplots()

# Load in data
tips = pd.read_csv(
    "https://raw.githubusercontent.com/mwaskom/seaborn-data/master/tips.csv")

# Create violinplot
ax.violinplot(tips["total_bill"], vert=False)

# Show the plot
plt.show()

#--Seaborn-OK-----------------------------------------------------------
# Import necessary libraries
import seaborn as sns
import matplotlib.pyplot as plt

# Load the data
tips = sns.load_dataset("tips")

# Create the boxplot
ax = sns.boxplot(x="total_bill", data=tips)

# Set the `xlim`
ax.set(xlim=(0, 100))

# Show the plot
plt.show()

#--Seaborn-OK-----------------------------------------------------------
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import ListedColormap

# Define a variable N
N = 500

# Construct the colormap
current_palette = sns.color_palette("muted", n_colors=5)
cmap = ListedColormap(sns.color_palette(current_palette).as_hex())

# Initialize the data
data1 = np.random.randn(N)
data2 = np.random.randn(N)
# Assume that there are 5 possible labels
colors = np.random.randint(0, 5, N)

# Create a scatter plot
plt.scatter(data1, data2, c=colors, cmap=cmap)

# Add a color bar
plt.colorbar()

# Show the plot
plt.show()

#--Seaborn-OK-----------------------------------------------------------
# Import the necessary libraries
import matplotlib.pyplot as plt
import seaborn as sns

# Load the data
tips = sns.load_dataset("tips")

# Create violinplot
sns.violinplot(x="total_bill", data=tips)

# Show the plot
plt.show()

#--Seaborn-OK-----------------------------------------------------------
# Import necessary libraries
import seaborn as sns
import matplotlib.pyplot as plt

# Load iris data
iris = sns.load_dataset("iris")

# Construct iris plot
sns.swarmplot(x="species", y="petal_length", data=iris)

# Show plot
plt.show()

#--Seaborn-OK-----------------------------------------------------------
import matplotlib.pyplot as plt
import seaborn as sns

# Load data
titanic = sns.load_dataset("titanic")

# Set up a factorplot
g = sns.factorplot(
    "class",
    "survived",
    "sex",
    data=titanic,
    kind="bar",
    palette="muted",
    legend=False)

# Show plot
plt.show()


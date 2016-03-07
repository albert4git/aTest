import numpy as np
import scipy.stats as ss
import matplotlib.pyplot as plt

# draw randomly from an exponential distribution
nums = np.random.exponential(size=1000)

# plot a histogram of the drawn numbers
plt.figure()
plt.hist(nums, bins=20, facecolor='green', alpha=0.5)
plt.xlabel('Number value')
plt.ylabel('Frequency')
plt.show()

# now do the draw 1000 times and save the means
all_means = []
for n in range(1000):
    mean = np.mean(np.random.exponential(size=1000))
    all_means.append(mean)

# plot the means to see what it looks like
plt.figure()
plt.hist(all_means, bins=20, facecolor='green', alpha=0.5)
plt.xlabel('Number value')
plt.ylabel('Frequency')
plt.show()

# do the collection of means have a normal distribution?
# pval < 0.05 means no
test_res = ss.mstats.normaltest(all_means)
print test_res[1]
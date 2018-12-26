import numpy as np
import scipy.stats
import matplotlib.pyplot as plt

# Some font settings
font = {'family' : 'Arial',
        'weight' : 'normal',
        'size'   : 12}
plt.rc('font', **font)

# Go through several standard deviations and sample sizes
all_std = [6, 36, 128]
all_ssize = [10, 100, 1000]
mdiff = 5
stnum = 25

f, axarr = plt.subplots(len(all_std), len(all_ssize))

for i, std in enumerate(all_std):
    for j, ssize in enumerate(all_ssize):
        data1 = np.random.normal(loc=stnum, scale=std, size=ssize)
        data2 = np.random.normal(loc=stnum-mdiff, scale=std, size=ssize)
        test_res = scipy.stats.ttest_ind(data1, data2)
        axarr[i, j].hist(data1, color='blue', bins=50, alpha=0.5)
        axarr[i, j].hist(data2, color='green', bins=50, alpha=0.5)
        axarr[i, j].set_title('P-value = {0:.4f}'.format(test_res[1]))
        axarr[i, j].set_ylabel('Std = '+str(std))
        axarr[i, j].set_xlabel('SSize = '+str(ssize))

plt.tight_layout()
plt.show()

# Ranksums test for non-normal data
all_num = [1, 10, 100]
all_diff = [0, 0.5, 2]

f, axarr = plt.subplots(len(all_num), len(all_diff))
for i, num in enumerate(all_num):
    for j, diff in enumerate(all_diff):
        data1 = np.concatenate((np.random.rand(5*num)*4, np.random.rand(2*num)*2, np.random.rand(3*num)*6))
        data2 = np.concatenate((np.random.rand(5*num)*(4+diff), np.random.rand(2*num)*(2+diff), np.random.rand(3*num)*(6+diff)))
        test_res = scipy.stats.ranksums(data1, data2)
        axarr[i, j].hist(data1, color='blue', bins=50, alpha=0.5)
        axarr[i, j].hist(data2, color='green', bins=50, alpha=0.5)
        axarr[i, j].set_title('P-value = {0:.4f}'.format(test_res[1]))
        axarr[i, j].set_ylabel('SFactor = '+str(num))
        axarr[i, j].set_xlabel('MDiff = '+str(diff))

plt.tight_layout()
plt.show()

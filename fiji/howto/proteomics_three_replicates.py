import sys, os
from pandas import Series, DataFrame
import pandas as pd
import numpy as np
import re
from datetime import datetime
import matplotlib
matplotlib.use('agg') 
import matplotlib.pyplot as plt
from scipy.stats import ttest_ind
	
table1='two-sample-three-replicate-comparison.txt'
if len(sys.argv)>1:
	table1 = sys.argv[1]

df1 = pd.read_table(table1)
df1=df1.fillna(0)

df1=df1.drop(['Peptide','PTM'], axis=1)
df2=df1.groupby(['Protein Accession'], sort=False).sum()
df2=df2[df2.max(axis=1)>=5]
df2=df2[(df2[['Sample1_01', 'Sample1_02', 'Sample1_03']].min(axis=1)>0) | (df2[['Sample2_01', 'Sample2_02', 'Sample2_03']].min(axis=1)>0)]
df2['Sample1']=df2[['Sample1_01', 'Sample1_02', 'Sample1_03']].mean(axis=1)
df2['Sample2']=df2[['Sample2_01', 'Sample2_02', 'Sample2_03']].mean(axis=1)
for col in df2.columns:
	df2[col+'-log2']=np.log(df2[col])/np.log(2)
p_threshold=0.01
t,p = ttest_ind(df2[['Sample1_01-log2', 'Sample1_02-log2', 'Sample1_03-log2']], df2[['Sample2_01-log2', 'Sample2_02-log2', 'Sample2_03-log2']],axis=1)
df2['p']=p
df2['p'][(df2[['Sample1_01', 'Sample1_02', 'Sample1_03']].sum(axis=1)==0)]=0
df2['p'][(df2[['Sample2_01', 'Sample2_02', 'Sample2_03']].sum(axis=1)==0)]=0
df2=df2.sort(columns='p')
df2['p threshold']=(np.linspace(1,len(df2),len(df2)))*p_threshold/len(df2)
df2['Significant']=df2['p']<df2['p threshold']
df2['ratio']=df2['Sample2']/(1.0*df2['Sample1'])
df2['sum']=df2['Sample2']+df2['Sample1']
df2['log2_sum']=np.log(df2['sum'])/np.log(2)
df2['ratio'][df2['Sample1']==0]=1024.0
df2['ratio'][df2['Sample2']==0]=1.0/1024
df2['log2_ratio']=np.log(df2['ratio'])/np.log(2)

fig, (ax1) = plt.subplots(1,figsize=(6,6))
ax1.scatter(df2['Sample1-log2'][df2['p']>=df2['p threshold']],df2['Sample2-log2'][df2['p']>=df2['p threshold']],c='black',lw=0,alpha=0.3)
ax1.scatter(df2['Sample1-log2'][df2['p']<df2['p threshold']],df2['Sample2-log2'][df2['p']<df2['p threshold']],c='red',lw=0,alpha=0.3)
plt.xlabel('Log2 Spectrum Count Basal')
plt.ylabel('Log2 Spectrum Count Luminal')
ax1.set_xlim([-0.5,max([max(df2['Sample1-log2']),max(df2['Sample2-log2'])])])
ax1.set_ylim([-0.5,max([max(df2['Sample1-log2']),max(df2['Sample2-log2'])])])
fig.savefig(table1[:-4]+'-log2.png',dpi=300,bbox_inches='tight')
plt.close(fig)

df2['Sample1-log2'][df2['Sample1']==0]=-0.4
df2['Sample2-log2'][df2['Sample2']==0]=-0.4

fig, (ax1) = plt.subplots(1,figsize=(6,6))
ax1.scatter(df2['Sample1-log2'][(df2['Sample1']==0)|(df2['Sample2']==0)],df2['Sample2-log2'][(df2['Sample1']==0)|(df2['Sample2']==0)],c='red',lw=0,alpha=0.3)
ax1.scatter(df2['Sample1-log2'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']<df2['p threshold'])],df2['Sample2-log2'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']<df2['p threshold'])],c='red',lw=0,alpha=0.3)
ax1.scatter(df2['Sample1-log2'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']>=df2['p threshold'])],df2['Sample2-log2'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']>=df2['p threshold'])],c='black',lw=0,alpha=0.3)
plt.xlabel('Log2 Spectrum Count Basal')
plt.ylabel('Log2 Spectrum Count Luminal')
ax1.set_xlim([-0.5,max([max(df2['Sample1-log2']),max(df2['Sample2-log2'])])])
ax1.set_ylim([-0.5,max([max(df2['Sample1-log2']),max(df2['Sample2-log2'])])])
fig.savefig(table1+'-log2-zeros.png',dpi=300,bbox_inches='tight')
plt.close(fig)


fig, (ax1) = plt.subplots(1,figsize=(6,6))
ax1.scatter(df2['log2_ratio'][(df2['Sample1']==0)|(df2['Sample2']==0)],df2['log2_sum'][(df2['Sample1']==0)|(df2['Sample2']==0)],c='red',lw=0,alpha=0.3)
ax1.scatter(df2['log2_ratio'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']<df2['p threshold'])],df2['log2_sum'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']<df2['p threshold'])],c='red',lw=0,alpha=0.3)
ax1.scatter(df2['log2_ratio'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']>=df2['p threshold'])],df2['log2_sum'][(df2['Sample1']!=0)&(df2['Sample2']!=0)&(df2['p']>=df2['p threshold'])],c='black',lw=0,alpha=0.3)
plt.xlabel('Log2 Spectrum Count Ratio (Luminal/Basal)')
plt.ylabel('Log2 Sum Spectrum Count')
ax1.set_xlim([-10.5,10.5])
ax1.set_ylim([min(df2['log2_sum']),max(df2['log2_sum'])])
fig.savefig(table1+'-ratio-sum.png',dpi=300,bbox_inches='tight')
plt.close(fig)

fig, (ax1) = plt.subplots(1,figsize=(6,6))
ax1.plot([0,1],[0,0],c='black',lw=1)
ax1.hist(df2['log2_ratio'],bins=100,histtype='step',color='black',normed=False) #range=[-1,1],
plt.xlabel('Log2 Spectrum Count Ratio (Luminal/Basal)')
plt.ylabel('# of proteins')
ax1.set_xlim([-10.5,10.5])
fig.savefig(table1+'-log2-hist.png',dpi=300,bbox_inches='tight')
plt.close(fig)

df2['Sample1-log2'][df2['Sample1']==0]=None
df2['Sample2-log2'][df2['Sample2']==0]=None
df2.to_csv(table1[:-4]+'.protein.txt',index=True,index_label='protein',sep='\t',na_rep='')
# Review sheet 4_1
from pylab import *
#Exercise 2:
def Iinj_gauss(Imean,Isigma):
	return Imean+Isigma*randn(1)

# Integration parameters
dt = 5e-6   # all times in seconds
tmax = 1

# Model parameters
Cm = 1.    # uF / cm^2
Rm = 0.1  # MOhm*cm^2
v_rest, v_th =0, 10
t_refractory=0 		# TRY OUT DIFFERENT CASES FOR t_refractory, e.g. 1e-3 and check the ISI distributions

# Initial conditions
v0 = 0.    # all voltages in mV

def IAF(dt,tmax,Cm,Rm,Imean,Isigma):
    tlist = [0.]
    vlist = [v0]
    ilist=[0]
    tspikes=[] # list that contains spiketimes
    for t in arange(dt,tmax,dt):
	ilast = ilist[-1]
        vlast = vlist[-1]
        vnew =  vlast + (-vlast/(Cm*Rm) + ilast/Cm)*dt
        if vnew >= v_th:
		vnew=v_rest
		tspikes.append(t)
		
	if vlast==v_rest and len(tspikes)!=0 and t-tspikes[-1]<t_refractory:
		vnew=v_rest
		
	ilist.append(Iinj_gauss(Imean,Isigma))
        vlist.append(vnew)
        tlist.append(t)
    return [ilist,vlist,tlist,tspikes]


mean,sigma=1000.0, 500.0
[ilist,vlist,tlist,tspikes] = IAF(dt,tmax,Cm,Rm,mean,sigma)

isi=diff(asarray(tspikes))
hist(isi)
xlabel('ISI - Times between successive spikes')
ylabel('Rate')
show()










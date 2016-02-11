# Review sheet 4_1
# Exercise 1:
from pylab import *

# Integration parameters
dt = 1e-6   # all times in seconds
tmax = 0.05

# Model parameters
Cm = 1.    # uF / cm^2
Rm = 0.1  # MOhm*cm^2
v_rest, v_th =0, 10
t_refractory=1e-3

i=900

# Initial conditions
v0 = 0.    # all voltages in mV

def IAF(dt,tmax):
    tlist = [0.]
    vlist = [v0]

    tspikes=[] # list that contains spiketimes
    for t in arange(dt,tmax,dt):
        vlast = vlist[-1]
        vnew =  vlast + (-vlast/(Cm*Rm) + i/Cm)*dt
        if vnew >= v_th:
		vnew=v_rest
		tspikes.append(t)
	
	if vlast==v_rest and len(tspikes)!=0 and t-tspikes[-1]<t_refractory:
		vnew=v_rest
		
        vlist.append(vnew)
        tlist.append(t)
    return [vlist,tlist,tspikes]

[vlist,tlist,tspikes] = IAF(dt,tmax)
plot(tlist,vlist)
xlabel('Time in seconds')
ylabel('Membrane voltage in mV')
show()













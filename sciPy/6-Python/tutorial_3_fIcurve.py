from pylab import *

# define the current input
# take the time and make yourself clear what the where-functions are doing
# mind that tjump is a tuple
def Iinj(t,tjump,Iamp):
    """
    creates a current pulse with amplitude Iamp that starts at tjump[0] and stops at tjump[1]
    """
    return Iamp
    #return where(array(t)<tjump[0],0,Iamp) * where(array(t)>tjump[1],0,1)
    
# integration parameters
dt = 1e-4   # all times in seconds
tmax = 0.5

# model parameters
#Iamp = 4000.            # uA / cm^2
tjump = (0.001,0.02)

Cm = 1.    # uF / cm^2
Rm = 0.01  # MOhm*cm^2
vthresh = 10
vreset = -10
vspike = 100

# initial conditions
# two lists are created: one eventually containing all values for time,
# the other is filled with values of the voltage
v0 = 0.    # all voltages in mV

Iamps = arange(950,1200,2.5)
stime2 = 0
f = []
vnew = v0
for Iamp in Iamps:
    tlist = [0.]
    vlist = [v0]
    ilist = [Iinj(0,tjump,Iamp)]
    # this loop goes through each step in time and evaluates the voltage according to the differential equation
    # make yourself clear what the first two assignments do
    # the new values for time and voltage are appended to their corresponding list
    count = 0
    for t in arange(dt,tmax,dt):
        vlast = vnew
        if vlast == vspike:
            vnew = vreset
        elif vlast >= vthresh:
            if count==0:
                stime1 = t
                count += 1
            elif count==1:
                stime2 = t
                count += 1
            vnew = vspike
        else:
            vnew =  vlast + (-vlast/(Cm*Rm) + Iinj(t,tjump,Iamp)/Cm)*dt
        
        vlist.append(vnew)
        ilist.append(Iinj(t,tjump,Iamp))
        tlist.append(t)
    
    if stime2==0:
        f.append(0)
    else:
        f.append(1./(stime2-stime1))
    
    """
    subplot(211)
    plot(tlist,ilist)
    ylabel('Iinj ($\mu$A / cm$^2$)')
    axis([0,tmax,0,1.2*Iamp])
    subplot(212)
    plot(tlist,vlist)
    xlabel('t (s)')
    ylabel('V (mV)')
    #show()
    """

figure()
plot(Iamps,f,'.')
xlabel('Current amplitude')
ylabel('firing rate')
show()

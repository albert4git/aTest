# -*- coding: utf-8 -*-
from pylab import *

def euler((tn,zn,dt),system_ode):
    return (tn+dt,tuple(array(zn) + dt*array(system_ode(tn,zn))))

def oscillator(tn, zn):
    (x,y) = zn
    return (- omega*y+b*x,omega*x+b*y)


# Integration parameters
dt = 1e-3
tmax = 50
times=arange(0,tmax,dt)

# Model parameters
omega=1
b=-0.1 # here try +0.1, 0 and -0.1

tlist = [0]
xlist = [1]
ylist = [0]

for tt in times:
	(tnew,znew) = euler((tlist[-1],(xlist[-1],ylist[-1]),dt),oscillator)
	(xnew,ynew) = znew
	tlist.append(tnew)
	xlist.append(xnew)
	ylist.append(ynew)

# plotting phaseplane
subplot(311)
plot(xlist,ylist)
xlabel(r'x')
ylabel(r'y')
title('Phasespace')
subplot(312)
plot(tlist,xlist)
xlabel(r't')
ylabel(r'x')
subplot(313)
plot(tlist,ylist)
xlabel(r't')
ylabel(r'y')
show()

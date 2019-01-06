from pylab import *


# define the current input
# take the time and make yourself clear what the where-functions are doing
# mind that tjump is a tuple
def Iinj(t, tjump, Iamp):
    """
    creates a current pulse with amplitude Iamp that starts at tjump[0] and stops at tjump[1]
    """
    return where(array(t) < tjump[0], 0, Iamp) * where(
        array(t) > tjump[1], 0, 1)


# integration parameters
dt = 1e-4  # all times in seconds
tmax = 0.05

# model parameters
Iamp = 2.  # uA / cm^2
tjump = (0.001, 0.02)

Cm = 1.  # uF / cm^2
Rm = 0.01  # MOhm*cm^2

# initial conditions
# two lists are created: one eventually containing all values for time,
# the other is filled with values of the voltage
v0 = 0.  # all voltages in mV

tlist = [0.]
vlist = [v0]
vth = .005  # thrash hold
vspike = 1
vreset = 0
# this loop goes through each step in time and evaluates the voltage according to the differential equation
# make yourself clear what the first two assignments do
# the new values for time and voltage are appended to their corresponding list
for t in arange(dt, tmax, dt):
    vlast = vlist[-1]
    vnew = vlast + (-vlast / (Cm * Rm) + Iinj(t, tjump, Iamp) / Cm) * dt
    if vnew >= vth:
        vnew = vspike
    if vlast == vspike:
        vnew = vreset

    vlist.append(vnew)
    tlist.append(t)

subplot(211)
plot(tlist, Iinj(tlist, tjump, Iamp))  # the function Iinj also accepts lists
ylabel('Iinj ($\mu$A / cm$^2$)')
axis([0, tmax, 0, 1.2 * Iamp])
subplot(212)
plot(tlist, vlist)
xlabel('t (s)')
ylabel('V (mV)')
show()

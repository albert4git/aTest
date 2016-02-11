from pylab import *
from scipy.integrate import odeint

def hohu(yn,tn):
    """
    The classical Hogdkin-Huxley Model
    """
    #A parenthesis not necessary
    (v,m,h,n)=yn
    dn = gating(n,v,alpha_n,beta_n)
    dm = gating(m,v,alpha_m,beta_m)
    dh = gating(h,v,alpha_h,beta_h)
    
    INa = gNa * m**3 * h * (v - ENa)
    IK = gK * n**4 * (v - EK)
    ILeak = gLeak * (v - ELeak)
    dv = -1./Cm * (INa + IK + ILeak - Iinj(tn,tjump,Iamp))

    #A parenthesis not necessary
    return (dv,dm,dh,dn)


#A possibility of defining an alpha-like func and a beta-like func and
# then customize them with parameters to form alpha_n, beta_n, etc or
# just call them inside hohu with the right parameters... (that are
# passed to hohu as a dictionary)

def gating(x,v,alpha,beta):
    return alpha(v)*(1-x) - beta(v)*x
    
def alpha_n(v):
    return (10.-v)/(100.*(exp((10.-v)/10.) - 1))

def beta_n(v):
    return 0.125*exp(-v/80.)
    
def alpha_m(v):
    return (25.-v)/(10.*(exp((25.-v)/10.) - 1))

def beta_m(v):
    return 4*exp(-v/18.)
    
def alpha_h(v):
    return 0.07*exp(-v/20.)

def beta_h(v):
    return 1./(exp((30.-v)/10.) + 1)
    
def Iinj(t,tjump,Iamp):
    return where(array(t)<tjump[0],0,Iamp) * where(array(t)>tjump[1],0,1)
    
if __name__ == "__main__":
    
    # integration parameters
    dt = 0.01
    toff = 20
 
# strange: the parameters given in Dayan & Abbott (p.173)
# don't make the neuron fire
# A yes, this is known...
    Iamp = 20.
    tjump = (10.,11.5)
    
    tmax = tjump[1]+toff
    
    # parameters taken from Koch's 'Biophysics of Computation'

    # A(aesthetical note): I would like to see this more compact in a
    # dictionary. (serious note) we should avoid (at least for teaching)
    # accesing variables from the global namespace - i.e. pass
    # dictionary.
    gLeak=0.3
    gK=36.
    gNa=120.
    ELeak=10.6
    EK=-12.
    ENa=115.
    Cm=1.
    
    # initial conditions

    # A why not compute them from v0? eliminates dependencies...
    v0 = 0.
    n0 = 0.3177#alpha_n(v0)/(alpha_n(v0) + beta_n(v0))
    m0 = 0.0529#alpha_m(v0)/(alpha_m(v0) + beta_m(v0))
    h0 = 0.5961#alpha_h(v0)/(alpha_h(v0) + beta_h(v0))

    #integration
    
    #A don't call arrays lists
    tlist = arange(0,tmax,dt)
    results = transpose(odeint(hohu,(v0,m0,h0,n0),tlist))
    #A list unpacking: v,n,m,h = results ?
    vlist = results[0]
    nlist = results[1]
    mlist = results[2]
    hlist = results[3]
    
    
    # plotting
    figure()
    subplot(511)
    plot(tlist,Iinj(tlist,tjump,Iamp))
    ylabel('Iinj ($\mu$A / cm^2)')
    axis([0,tjump[1]+toff,0,1.2*Iamp])
    subplot(512)
    plot(tlist,mlist)
    ylabel('m')
    axis([0,tjump[1]+toff,0,1])
    subplot(513)
    plot(tlist,hlist)
    ylabel('h')
    axis([0,tjump[1]+toff,0,1])
    subplot(514)
    plot(tlist,nlist)
    ylabel('n')
    axis([0,tjump[1]+toff,0,1])
    subplot(515)
    plot(tlist,vlist)
    plot(tlist,squeeze(zeros((1,len(vlist)))),'gray')
    xlabel('t (ms)')
    ylabel('V (mV)')
    axis([0,tjump[1]+toff,-20,max(vlist)])

    #A use comments better than docstrings
    """
    figure(2,figsize = fig_size,dpi=80)
    subplot(411)
    plot(tlist,vlist)
    plot(tlist,squeeze(zeros((1,len(vlist)))),'gray')
    ylabel('V (mV)')
    axis([0,tjump[1]+toff,-20,100])
    subplot(412)
    plot(tlist,inalist)
    ylabel('INa ($\mu$A / cm^2)')
    axis([0,tjump[1]+toff,min(inalist),max(inalist)])
    subplot(413)
    plot(tlist,iklist)
    ylabel('IK ($\mu$A / cm^2)')
    axis([0,tjump[1]+toff,min(iklist),max(iklist)])
    subplot(414)
    plot(tlist,illist)
    xlabel('t (ms)')
    ylabel('ILeak ($\mu$A / cm^2)')
    axis([0,tjump[1]+toff,min(illist),max(illist)])
    """
    show()

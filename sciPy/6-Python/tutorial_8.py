# -*- coding: utf-8 -*-
from pylab import *
from numpy.linalg import *
from numpy import matrix

def alpha_synapse(t,tstart,tau,sigma,umax):
    return (umax*(1-exp(-(t-tstart)/tau))*where(array(t)>tstart,1,0)*where(array(t)<=tstart+5*tau,1,0)+umax*where(array(t)>(tstart+5*tau),1,0)*exp((5*tau-(t-tstart))/sigma))

def plot_alpha():
    plot(time,U)
    xlabel('time in ms')
    ylabel('Voltage in mV')
    title(r'$\alpha$ shape post synaptic potential')
    show()

def assemble_connectivity_matrix():
    A=zeros((M,M))
    for i in range(M):
        A[i,i]=2*gi+gm

	if i==M-1:
	  A[i,i]=gi+gm
	else:
	  A[i+1,i]=-gi	
	  A[i,i+1]=-gi

    return matrix(A)


if __name__ == "__main__":
    
    # integration parameters
    dt = .01
    tmax=30
    
    time = arange(0,tmax,dt)
    
    ## Multicompartment parameters:
    M=4		# number of compartments, has to be bigger than 1.
    gi=1	# Dendrite conductance
    gm=1./100	# Membrane conductance
    E=10	# Leak voltage

    U=alpha_synapse(time,5,.5,2,20)

    #plot_alpha()

    G=assemble_connectivity_matrix()
    G_inv=linalg.inv(G)

    ''' As explained in the tutorial we can solve the linear system:
    G*V=E*gm*(1,1,...)+gi*(input,0,0..), where input is the input voltage U_alpha and V is the 
    vector of voltages at all the nodes by calculating:
    V=G_inv*(E*gm*(1,1,...)+(input,0,0..))

    Since our input is time dependent, we calculate all the voltages at the nodes for all time points at once
    by arranging the right hand side properly, i.e. with W=E*gm*(1,1,...)+gi*(input,0,0..) as matrix:
    [W(0),W(dt),...W(tmax)]  In the subsequent code this matrix is called input_matrix. Note that for this purpose we have 
    to transpose U in order to get the proper shape.
    ''' 
    input_matrix=zeros((M-1,size(U)))
    input_matrix=vstack((1*transpose(U),input_matrix))
    input_matrix=input_matrix+gm*E

    result=transpose(G_inv*input_matrix)
    plot(time,result)
    print result
    title("Potential at compartment nodes")
    legend((r'node 1', r'node 2', r'node 3',r'node 4'), shadow = True)
    show()


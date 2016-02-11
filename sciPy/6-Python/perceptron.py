from pylab import sign, dot, asarray, where, zeros, transpose, sum, arange, figure, plot, show, scatter
from datagen import datagen


def sgn(x):
    sgn = sign(asarray(x))
    return where(sgn==0,1,sgn)

def neuron(w,inp): # w0 = threshold, always: input[0] = -1
    return sgn(dot(w,transpose(inp)))
    
def learn(rate,desire,inp,weight):
    """
    desire ... one number;
    input ... one input vector
    wini ... initial weights
    """
    inp = asarray(inp)
    weight = asarray(weight)
    
    if neuron(weight,inp) == desire:
        dw = zeros(len(inp))
    else:
        dw = rate* desire * inp
    return dw




"""
# learning the NAND operation:
teacher = [1.,1.,1.,-1.]
training = asarray([[-1,0,0],[-1,1,0],[-1,0,1],[-1,1,1]])
weight = [0.,0.,0.]
"""

training, teacher = datagen(200)

P = len(teacher)
weight = [0.,0.,0.]
rate = 2.
maxgen = 100000



# run till convergence
for ii in range(maxgen):
    if (neuron(weight,training) == teacher).all():
        print str(ii) + ' iterations'
        break
    else:
        dw = learn(rate,teacher[ii%P],training[ii%P],weight)
        weight += dw


output = neuron(weight,training)
#print teacher
#print weight
#print output

if (output == teacher).all():
    print 'All right'
    
w = weight

# theoretically expected number of iterations (upper bound)
p = transpose(training)
Rsquare = max(sum(training**2,axis=1))
xi = (-p[2]*w[1]*w[2] + p[1]*w[2]**2 + w[1]*w[0])/(w[1]**2 + w[2]**2)
yi = w[0]/w[2] - (w[1]/w[2]) * xi
di = (p[1]-xi)**2 + (p[2]-yi)**2

Dsquare = min(di)
print 'M = ' + str(Rsquare/Dsquare)

# take a look at the data:
# -w0 + w1 x1 + w2 x2 = 0
# ->  x2 = w0/w2 - w1/w2 x1

x = arange(-2,2,0.01)
data = transpose(training)

figure()
plot(x,w[0]/w[2] - (w[1]/w[2]) * x)
scatter(data[1],data[2],c=teacher)
show()

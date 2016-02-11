from pylab import array, rand, sign, concatenate, transpose, ones


def datagen(N):
    """
    Produces N pairs of training data and desired output;
    each sample of training data contains -1 in its first position,
    this corresponds to the interpretation of the threshold as first
    element of the weight vector
    """

    fun1 = lambda x1,x2: -2*x1**3-x2+.5*x1**2
    fun2 = lambda x1,x2: x1**2*x2+2*x1*x2+1
    fun3 = lambda x1,x2: .5*x1*x2**2+x2**2-2*x1**2
    
    rarr1 = rand(1,N)
    rarr2 = rand(1,N)
    
    teacher = sign(rand(1,N)-.5)
    
    idplus  = (teacher<0)
    idminus = -idplus
    
    rarr1[idplus] = rarr1[idplus]-1
    
    y1=fun1(rarr1,rarr2)
    y2=fun2(rarr1,rarr2)
    y3=fun3(rarr1,rarr2)
    
    x=transpose(concatenate((-ones((1,N)),y1,y2)))
    
    return x, teacher[0]

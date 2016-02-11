from __future__ import division
from numpy import outer, diag, ones, array,\
     asarray, zeros, dot, transpose, sign, where, add
import Image
import os
import operator


###########################################################################
# The Hopfield model
###########################################################################

def signpos(x):
    """Return array of signs of x with convention sgn(0)=1."""
    return asarray(
        where(x, sign(x), 1),
        dtype='int8')


def learn_one(p, autapse=False):
    """One-pattern term for imprinting a Hopfield network weight matrix."""
    p = asarray(p, dtype='int8').flat
    term = outer(p,p)
    return term - diag(diag(term)) if not autapse else term


def learn(patterns, patsize):
    weights = zeros((patsize,patsize))
    for p in patterns:
        weights += learn_one(p)
    return weights/patsize


def energy(weights, p):
    """Energy of the pattern p in the Hopfield network defined by weights."""
    return -(dot(p, dot(weights, p)))/2


def is_steady(weights, p, k=1):
    """Is the pattern stable after k iterations?."""
    #XXX Generalization: find the smallest k so that p is
    #    reproduced with fidelity f in the Hamming norm.
    return (p==hopfield(weights, p, k)).all()


def hopfield(weights, p, k):
    """Return activation pattern after k applications of Hopfield rule."""
    for i in range(k):
        p = signpos(dot(weights, p))
    return p


def chopfield(weights, p, k=None):
    """Return activation pattern after k>=1 applications of Hopfield rule
    or if k not specified, until it converges"""
    n=0 # number of iterations 
    while True:
        newp = signpos(dot(weights, p))
        n+=1
        if k:
            if n == k:
                print n
                return p
        else:
            if (newp==p).all():
                print n
                return p
        p = newp



def loadimgs(filenames):
    """Return a pattern from a thresholded NxN grayscale image as a
    1xN^2 activation array."""
    for fname in filenames:
        graylev = Image.open(fname).convert('L') # load as grayscale (0-255 int)
        yield asarray(where(asarray(graylev) >= BWTHR, 1, -1), 'int8').flat

def saveimg(pattern, fname):
    """Save an image to passed-in filename."""
    inbytes = asarray(where(pattern==1, 255*ones(patsize), zeros(patsize)), 'uint8')
    im = Image.fromarray(inbytes.reshape(IMSIZE), 'L')
    print 'Saving to ', fname
    im.save(fname)

###########################################################################
# Exercise with N=4
###########################################################################

A, B, C = (1,-1,1,-1), (-1,1,1,1), (-1,-1,-1,1)
weights = learn((A,B,C), 4)

for p in A, B, C:
    print p, is_steady(weights,p) # part b): only A is stable
    print energy(weights, p)


###########################################################################
# Exercise with images
###########################################################################

##################
# Initialization #
##################

LPATDIR = 'FourPatterns/'     # patterns to be learned
CPATDIR = 'FourPartial/'  # patterns to be reconstructed
TGTDIR  = 'Recovered'         # where to save the results
IMSIZE  = (100,100)           # size of img in pixels
BWTHR   = 128                 # threshold btw black and white (0-255)

patsize = IMSIZE[0]*IMSIZE[1]
learnfiles = [os.path.join(LPATDIR, f) for f in os.listdir(LPATDIR)]
recofiles  = [os.path.join(CPATDIR, f) for f in os.listdir(CPATDIR)]

iweights = learn(loadimgs(learnfiles), patsize)
for p, fname in zip(loadimgs(recofiles), recofiles):
    newp = chopfield(iweights, p)
    saveimg(newp,os.path.join(TGTDIR, os.path.split(fname)[-1]))
     

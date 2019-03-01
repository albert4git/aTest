# python search path ???

import math
from TurtleWorld import *

world = TurtleWorld()
bob = Turtle()


def square100(t):
    for i in range(4):
        fd(t, 100)
        lt(t)


square100(bob)

ray = Turtle()


def square(t, length):
    for i in range(4):
        fd(t, length)
        lt(t)


square(bob, 190)


def polygon(t, n, length):
    def circle(t, r):
        circumference = 2 * math.pi * r
        n = 50
        length = circumference / n
        polygon(t, n, length)
        angle = 360.0 / n
        for i in range(n):
            fd(t, length)
            lt(t, angle)


# def circle(t, r):
#     circumference = 2 * math.pi * r
#     n = 50
#     length = circumference / n
#     polygon(t, n, length)


def circle(t, r):
    circumference = 2 * math.pi * r
    n = int(circumference / 3) + 1
    length = circumference / n
    polygon(t, n, length)


circle(10, 50)

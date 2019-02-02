#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.

"""

"""
# about global objects in the program

from types import ModuleType

def info(n_obj):

    # Create a reference to the object
    obj = globals()[n_obj]

    # Show object information 
    print 'Name of object:', n_obj
    print 'Identifier:', id(obj)
    print 'Typo:', type(obj)
    print 'Representation:', repr(obj)

    # If it is a module
    if isinstance(obj, ModuleType):
        print 'itens:'
        for item in dir(obj):
            print item
    print

# Showing information
for n_obj in dir()[:10]: # The slice [:10] is used just to limit objects
    info(n_obj)

#===========================================================

import os.path
# inspect: "friendly" introspection module
import inspect

print 'Object:', inspect.getmodule(os.path)

print 'Class?', inspect.isclass(str)

# Lists all functions that exist in "os.path"

print 'Member:',

for name, struct in inspect.getmembers(os.path):

    if inspect.isfunction(struct):
        print name, 

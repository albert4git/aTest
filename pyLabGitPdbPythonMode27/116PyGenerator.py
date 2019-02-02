#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""


def gen_pares():
    """
    Generates even numbers from 0 to 20
    """
    i = 0

    while i <= 20:
        yield i
        i += 2


# Shows each number and goes to the next
for n in gen_pares():
    print n

#============================================================

import os


# Finds files recursively
def find(path='.'):

    for item in os.listdir(path):
        fn = os.path.normpath(os.path.join(path, item))

        if os.path.isdir(fn):

            for f in find(fn):
                yield f

        else:
            yield fn


# At each interaction, the generator yeld a new file name
for fn in find():
    print fn

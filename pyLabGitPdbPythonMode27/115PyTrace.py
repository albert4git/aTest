#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
import sys
import traceback

# Try to get a file name
try:
    fn = raw_input('Nome do arquivo: ').strip()

    # Numbering lines
    for i, s in enumerate(file(fn)):
        print i + 1, s,

# If an error happens
except:

    # Show it on the screen
    trace = traceback.format_exc()

    # And save it on a file
    print 'An error happened:\n', trace
    file('trace.log', 'a').write(trace)

    # end the program
    raise SystemExit

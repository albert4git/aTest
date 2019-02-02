#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
#==========================================================

import time

# localtime() Returns a date and local time in the form
# of a structure called struct_time, which is a
# collection with the items: year, month, day, hour, minute,
# secund, day of the week, day of the year and e daylight saving time
print time.localtime()

# asctime() returns a date and hour with string, according to
# operating system configuration
print time.asctime()

# time() returns system time in seconds
ts1 = time.time()

# gmtime() converts seconds to struct_time
tt1 = time.gmtime(ts1)
print ts1, '->', tt1

# Adding an hour
tt2 = time.gmtime(ts1 + 3600.)

# mktime() converts struct_time  to seconds
ts2 = time.mktime(tt2)
print ts2, '->', tt2

# clock() returs time since the program started, in seconds
print 'The program took', time.clock(), \
    'seconds up to now...'

# Counting seconds...
for i in xrange(5):

    # sleep() waits the number of seconds specified as parameter
    time.sleep(1)
    print i + 1, 'second(s)'

#======================================================
import datetime

# datetime() receives as parameter:
# year, month, day, hour, minute, second and
# returns an object of type datetime
dt = datetime.datetime(2020, 12, 31, 23, 59, 59)

# Objects date and time can be created from
# a datetime object
date = dt.date()
hour = dt.time()

# How many time to 12/31/2020
dd = dt - dt.today()

print 'Date:', date
print 'Hour:', hour
print 'How many time to 12/31/2020:', dd

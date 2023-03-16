#!/usr/bin/python

import time

print """
Conversts a tuple or struct_time from
gmtime() or localtime() to a 24 hours string
t = time.localtime()"""


t = time.localtime()
print "time.asctime(t) %s" % time.asctime(t)








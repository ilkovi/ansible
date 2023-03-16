#!/usr/bin/python

import os.path, os, __main__
import sys, string
def testprogpath():
 print "1", os.path.dirname(sys.path[0])
 print "2", os.path.dirname(os.path.realpath(sys.argv[0]))
 print "3", os.path.dirname(os.path.abspath(getattr(__main__,'__file__','__main__.py')))
 print "4", sys.path[0]
 print
testprogpath()
os.chdir("/")
testprogpath()

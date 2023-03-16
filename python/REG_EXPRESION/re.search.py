#!/usr/bin/python

import re

line = "cats are smarter than dogs"

matchObj =re.search( r'(.*) are (.*?) .*', line, re.M|re.I)

if matchObj:
  print "matchObjd.group() :", matchObj.group()
  print "matchObjd.group(1) :", matchObj.group(1)
  print "matchObjd.group(2) :", matchObj.group(2)
else:
  print "No match!!"



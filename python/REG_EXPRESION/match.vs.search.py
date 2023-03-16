#!/usr/bin/python

import re

line = "cats are smarter than dogs"

matchObj =re.match( r'dogs', line, re.M|re.I)

if matchObj:
  print "match --> matchObj.groutp() :", matchObj.group()
else:
  print "No match!!"


searchObj = re.search( r'dogs', line, re.M|re.I)
if searchObj:
  print "search --> serachObj.group() :", searchObj.group()
else:
  print "Nothing found!!"





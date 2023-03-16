#!/usr/bin/python

# Open a file 
fo = open("foo.txt", "rw+") 
print "Name of the file: ", fo.name 
 
 
for index in range(5): 
   Line = fo.next() 
   print "Line No %d - %s" % (index, Line) 
 
# Close opend file 
fo.close()

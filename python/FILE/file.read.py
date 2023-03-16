#!/usr/bin/python

# Open a file 
fo = open("foo.txt", "rw+") 
print "Name of the file: ", fo.name 
 
 
line = fo.read(10)
print "Read LIne: %s" % (line)


 
# Close opend file 
fo.close()

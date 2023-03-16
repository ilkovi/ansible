#!/usr/bin/python

# Open a file 
fo = open("foo.txt", "rw+") 
print "Name of the file: ", fo.name 
 
 
line = fo.readline()
print "Read Line (): %s" % (line)


line = fo.readline(5)
print "Read Line (5): %s" % (line)
 
# Close opend file 
fo.close()

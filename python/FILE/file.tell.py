#!/usr/bin/python

# Open a file 
fo = open("foo.txt", "rw+") 
print "Name of the file: ", fo.name 
 
 
line = fo.readline()
print "Read Line (): %s" % (line)


# Again set the pointer to the begining
pos = fo.tell()
print "Current Position: %d" % (pos)

 
# Close opend file 
fo.close()

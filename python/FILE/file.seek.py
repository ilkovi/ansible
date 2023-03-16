#!/usr/bin/python

# Open a file 
fo = open("foo.txt", "rw+") 
print "Name of the file: ", fo.name 
 
 
line = fo.readline()
print "Read Line (): %s" % (line)


# Again set the pointer to the begining
fo.seek(0,0)

line = fo.readline()
print "Read Line (5): %s" % (line)
 
# Close opend file 
fo.close()

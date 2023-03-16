#!/usr/bin/python

# Open a file 
fo = open("foo.txt", "rw+") 
print "Name of the file: ", fo.name 
 
 
line = fo.readline()
print "Read Line (): %s" % (line)

str = "This is 6th line"

# Write a line at the end of the file
fo.seek(0,2)
line = fo.write( str )

# Now read complete file from beginning.
fo.seek(0,0)
for index in range(6):
  line = fo.next()
  print "Line No %d - %s" % (index, line)

 
# Close opend file 
fo.close()

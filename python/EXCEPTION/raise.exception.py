#!/usr/bin/python

def functionName( level ):
  try:
   if (level < 1):
    raise Exception("Invalid_level!")
    # The code below to this would not be executed
    # if we raise the exception
    print "Level is: ", level
  except "Invalid_level!":
    print "Exception handling here...."
  else:
    print " Rest of the code here"

functionName(4)
functionName(0)



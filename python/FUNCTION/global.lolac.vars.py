#!/usr/bin/python

total = 0; # This is global variable.
# Function definition is here
def sum( arg1, arg2 ):
  # Add both the prameters and return them."
  total = arg1 + arg2; 	# Here total is local variable
  print "Inside the function local total :", total
  return total;

# Now you can call sum function
sum(10, 20);
print "Outsid the function global total : ", total


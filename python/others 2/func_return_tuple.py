#!/usr/bin/python

# function definition
def area_and_perimeter (b, h):
 A = b * h
 P = 2 * (b+h)
 return A, P
# main program using defined function
ar, per = area_and_perimeter ( 4, 3)
print ar
print per

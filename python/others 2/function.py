#!/usr/bin/python
""" Function must be define before calling them """

# function definitions
def area(b, h):
 """ calculate area of a rectangle"""
 A = b * h
 return A
def perimeter(b, h):
 """ calulates perimeter of a rectangle"""
 P = 2 * (b+h)
 return P
# main program using defined functions
width = 5
height = 3
print "Area = ", area(width, height)
print "Perimeter = ", perimeter(width, height)

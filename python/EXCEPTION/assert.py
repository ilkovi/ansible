#!/usr/bin/python

def KelvinToFaurenhein(Temperature):
   assert (Temperature >= 0),"Colder than absolute zero!"
   return ((Temperature-273)*1.8)+32

print KelvinToFaurenhein(273)
print int(KelvinToFaurenhein(505.78))

print KelvinToFaurenhein(-5)

#!/usr/bin/python

dict = {'Name': 'Zara', 'Age': 7};

print "Value : %s" % dict.get('Age')
print "Value : %s" % dict.get('Sex', "Never")

print "Current Disctionary is : %s " % dict

print "Value : %s" % dict.setdefault('Age', "test")
print "Value : %s" % dict.setdefault('Sex', "Never")

print "Current Disctionary is : %s " % dict

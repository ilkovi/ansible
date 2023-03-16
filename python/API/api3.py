#!/usr/bin/python

import urllib2		# most current version, least amount of bugs
import json

api_key = 'd5f8d6b9ad89af29'

url = 'https://httpbin.org/get'

json_obj = urllib2.urlopen(url)

data = json.load(json_obj)

print data

print "\n Data ojbect, orgin value: " + str(data['origin']) + "\n"

print data['headers']

print "\n Data object, header DICT: " + str(data['headers']) + "\n"


# this will print the keys of the DICTIONARY 
TEST = {}
TEST = data['headers']


print "Value : %s" % TEST.get('User-Agent')


#!/usr/bin/python

import urllib2		# most current version, least amount of bugs
import json

api_key = 'd5f8d6b9ad89af29'

url = 'https://httpbin.org/get'

json_obj = urllib2.urlopen(url)

print json.load(json_obj)



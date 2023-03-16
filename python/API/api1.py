#!/usr/bin/python

api_key = 'd5f8d6b9ad89af29'

import urllib2		# most current version, least amount of bugs
import json

urllib2.urlopen('https://httpbin.org/get')

print json.load(urllib2.urlopen('https://httpbin.org/get'))



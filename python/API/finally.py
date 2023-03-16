#!/usr/bin/python

import urllib2		# most current version, least amount of bugs
import json

api_key = 'd5f8d6b9ad89af29'

def function_search(query):
  api_key = 'd5f8d6b9ad89af29'
  url = 'https://httpbin.org/get'
  json_obj = urllib2.urlopen(url)
  data = json.load(json_obj)
  print data
  print "\n Data object, header DICT: " + str(data['headers']) + "\n"

  TEST = {}
  TEST = data['headers']

  print "Values :" + str(TEST)

  for item in TEST:
    #print "Value : %s" % TEST.get('User-Agent')
    print "Value : %s" % item


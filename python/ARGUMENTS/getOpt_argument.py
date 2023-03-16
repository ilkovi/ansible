#!/usr/bin/python

import sys,getopt

def main(argv):
  inputfile = ''
  outputfile = ''
  try:
    opts, args = getopt.getopt(argv,"hi:o:",["ifile=","ofile="])
  except getopt.GetoptError:
    print str(sys.argv[0]), '-i <inpurfile> -o <outputfile>'
    sys.exit(2)
  for opt, arg in opts:
    if opt == '-h':
      print str(sys.argv[0]), '-i <inpurfile> -o <outputfile>'
      sys.exit()
    elif opt in ("-i", "--ifile"):
      inputfile = arg
    elif opt in ("-o", "--ofile"):
      outputfile = arg
  print 'Input file is "', inputfile
  print 'Output file is "', outputfile
  print 'All optins list is', args
  print 'All option pairs are ', opts

if __name__ == "__main__":
  main(sys.argv[1:])

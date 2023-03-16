#!/usr/bin/python

import os

# create a directory "test"

os.mkdir("test")

# Changing a directory to "test"

os.chdir("test")

# This wouldgive location of the current directory

print "Currnet directory is :", os.getcwd()

os.chdir("../")

# This wod remove "test" directory.

os.rmdir("test")

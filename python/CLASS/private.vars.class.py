#!/usr/bin/python

class JustCounter:
  __secretCount = 0

  def count(self):
    self.__secretCount += 1
    print self.__secretCount

counter = JustCounter()

counter.count()

counter.count()

# you could access the private variable like
print counter._JustCounter__secretCount


# you could not access it like this
print counter.__secretCount

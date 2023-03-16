#!/usr/bin/python

import time

print """
returns the curren tprocessor time as a floating point number"""

def procedure():
  time.sleep(2.5)

# mesure proces time

t0 = time.clock()

procedure()
print time.clock() - t0, "seconds process time"

# mesure wall time

t0 = time.time()

procedure()
print time.time() - t0, "seconds wall time"

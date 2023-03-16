#!/usr/bin/python	

import socket 		# Import socket module

s = socket.socket()	# Create a socket object

host = socket.gethostname()	# Gel local machine name

port = 12345		# Reserve a port for you service.

s.bind((host, port))	# Bind to the port

s.listen(5)		# Now wait for client connectin.

while True:
  c, addr = s.accept()	# Establish connectin with client
  print 'Got connection from', addr
  c.send('Thank you for connecting')
  c.close()		# Close the connection

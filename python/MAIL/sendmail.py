#!/usr/bin/python

import smtplib

sender = 'ivan.ilkov@abv.bg'

receivers = ['to@todomain.com']

message = """ From: From Person <from@fromdomain.com>
To: To Person <to@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail mesasge.
"""

try:
  smtpObj = smtplib.SMTP('localhsot')
  snmtpObj.sendmail(sender, receivers, message)
  print "Successfully sent email"
except SMTPException:
  print "Error: unable to send email"

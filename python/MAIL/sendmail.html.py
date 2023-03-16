#!/usr/bin/python

import smtplib

message = """ From: From Person <from@fromdomain.com>
To: To Person <to@todomian.com>
MIME-Versin: 1.0
Content-type: text/thml
Subject: SMTP HTML e-mail test

This is an e-mail message to be sent in HTML format

<b> This is HTML message.</b>
<h1>This is headline.</h1>
"""


try:
  smtpObj = smtplib.STMP('localhost')
  smtpObj.sendmail(sender, receivers, message)
  print "Successfully sent email"
except SMTPException:
  print "Error: unable to send email"

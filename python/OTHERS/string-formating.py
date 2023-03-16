#!/usr/bin/python


string = "this is string example....wow!!!";


print "str.capitaliza() : ", string.capitalize()

print "str.center(40, 'a') : ", string.center(40, 'a')

sub = "i";
print "str.count(sub, 4,40) :", string.count(sub,4,40)

encode = string.encode('base64','strict');
print "Encoded String: " + encode;
print "Decoded String: " + encode.decode('base64','strict')

print "Encoded string with UTF8 :" + string.encode(encoding='UTF-8',errors='strict')

suffix = "wow!!!";
print string.endswith(suffix);
print string.endswith(suffix,20);
suffix = "is"
print string.endswith(suffix);

print "Default exapanded tab : " + string.expandtabs();
print "Double exapanded tab : " + string.expandtabs(3);

tofind = "exam";
print string.find(tofind);
print string.find(tofind,10);
print string.find(tofind,40);

print """
index is same as find, bur rise and exeption
if string is not find
shell return 1
"""
print string.index(tofind);
print string.index(tofind, 10);
#print string.index(tofind, 40);

# check string is alpha numeric
print string.isalnum();
print tofind.isalnum();

# check if string consist of digits only
digits = "12352";
print digits.isdigit();

# check if all case based characters are lowercase
print string.islower();


print """
isnumeric() checks if string is only numeric charcters
* works only for unicode objects
testunicode = u"342424234";
print testunicode.isnumeric();
"""
testunicode = u"342424234";
print testunicode.isnumeric();

print """ 17
isspace() checks if string consist of whitespaces

print string.isspace();
"""
print string.isspace();

print string.isupper();

tojoin = "-";
sec = ("a","b","c");
print tojoin.join( sec );


print "Length of the sting: ", len(string);

print "Left adjustmetn:", string.ljust(60, '0');

print "string.lower(); :", string.lower();

print "string.lstrip('this') :", string.lstrip('this');

from string import maketrans
intab = "aeiou"
outtab = "12345"
trantab = maketrans(intab, outtab)
print """
from string import maketrans
intab = "aeiou"
outtab = "12345" 
trantab = maketrans(intab, outtab)
"""
print "string.translate(trantab); :", string.translate(trantab);

print "max(string); ", max(string);
print "min(string); " + min(string);

print 'string.replace("is","was",3);', string.replace("is","was",3);








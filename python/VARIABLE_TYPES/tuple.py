#!/usr/bin/python

tuple = ( 'abcd', 789 , 2.23 , 'john' , 70.2 )
tinytuple = (123, 'ivan' )

print 'Main difference between lists and tuple is \ 
* lists could be updated \
* tuple not, they are read only \
* lists are with [] \
* tuple are with ()  '
print tuple 
print tuple[0]
print tuple[1:3]
print tuple[2:]
print tinytuple * 2
print tuple + tinytuple

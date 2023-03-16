#!/usr/bin/perl
 #ex23.plx
 use warnings;
 use strict;
 my @array = (1,2,3);
 my $element;
 print "Initial array is :",@array,"\n";
 unshift(@array,0);
 print "Array now is :",@array,"\n";
 $element = shift(@array);
 print "Array again is :",@array,"\n";
 print 'Value of $element is :',$element,"\n";

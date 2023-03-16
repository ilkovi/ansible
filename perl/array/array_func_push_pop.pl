#!/usr/bin/perl
 #ex22.plx
 use warnings;
 use strict;
 my @array = (1,2,3,4,5);
 my $element;
 print "Initial array is :",@array,"\n";
$element = pop (@array);
 print "Now our array is :",@array,"\n";
 print '$element have value :',$element,"\n";
@array = push (@array,$element);
 print "At the end our array is :",@array,"\n"


#$element = pop ((@array)[1]);
# print "Custome modification : ", @array, "\n";

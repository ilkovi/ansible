#!/usr/bin/perl
 #ex20.plx
 use warnings;
 use strict;

print "
 my \@array = (\"potato \", \"apple \",\"grapes \",\"peach \");
 print \"Array before reverse :\",\@array,\"\\n\";
 print \"Array after reverse :\", reverse \@array ;
 \n
";




 my @array = ("potato ", "apple ","grapes ","peach ");
 print "Array before reverse :",@array,"\n";
 print "Array after reverse :", reverse @array ;
 print "\n";
 print scalar @array, "\n";

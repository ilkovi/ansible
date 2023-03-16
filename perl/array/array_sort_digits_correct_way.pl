#!/usr/bin/perl
 #ex21b.plx
 use warnings;
 use strict;

print "

 my \@array = (2,1,10,3);
 print \"String sort :\",sort{\$a cmp \$b} \@array;print \"\\n\";
 print \"Number sort :\",sort{\$a <=> \$b} \@array;print \"\\n\";

";


 my @array = (2,1,10,3);
 print "String sort :",sort{$a cmp $b} @array;print "\n";
 print "Number sort :",sort{$a <=> $b} @array;print "\n";

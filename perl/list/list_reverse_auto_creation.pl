#!/usr/bin/perl
 use warnings;
 use strict;
 print ((1 .. 10)[1 .. 5])   ; print " --- print ((1 .. 10)[1 .. 5]); \n";
 
 my @test = reverse(1 .. 10) ; print "      --- my \@test = reverse(1 .. 10); \n";

 print (@test[1 .. 5]) ; print " --- print (\@test[1 .. 5]);\n";

 print ('a'..'z') ; print " ---  print ('a'..'z'); \n";

#!/usr/bin/perl
 use warnings;
 use strict;

print "

 my \@numbers = (1 .. 5);
 for my \$number (\@numbers) {\$number **= 2}
 for (\@numbers) {print \$_,\"\\n\"}

";

 my @numbers = (1 .. 5);
 for my $number (@numbers) {$number **= 2}
 for (@numbers) {print $_,"\n"}

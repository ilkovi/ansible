#!/usr/bin/perl
 use warnings;
 use strict;

print "
 my \@numbers = (9,4,6,2);
 my \$sum = 0;
 \$sum += \$_ for \@numbers;
 print \"Total sum is : \$sum\\n\";


";


 my @numbers = (9,4,6,2);
 my $sum = 0;
 $sum += $_ for @numbers;
 print "Total sum is : $sum\n";

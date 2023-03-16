#!/usr/bin/perl
 use warnings;
 use strict;

print "
 my \$num = 0;
 while (\$num < 10) {
 print \"\$num \";
 \$num++;
 }


";


 my $num = 0;
 while ($num < 10) {
 print "$num ";
 $num++;
 }

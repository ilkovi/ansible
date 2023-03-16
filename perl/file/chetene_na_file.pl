#!/usr/bin/perl
use warnings;
use strict;

print "\n # primer za chetene na fail 

open FILE, \"/home/perl/file/extented.txt\" or die \$!;
my \$line = 1;

while (<FILE>) {
          print \$line++;
          print \": \$_\";
}



";


open FILE, "/home/perl/file/extented.txt" or die $!;
my $line = 1;

while (<FILE>) {
          print $line++;
          print ": $_";
}


print " \n \n \t # Chetene na fail v 3 reda

 open FILE, \"extext.txt\" or die \$!;
 my \$line = 1;
 print \$line++,\": \$_\" while <FILE>;

";

 open FILE, "extented.txt" or die $!;
 my $line = 1;
 print $line++,": $_" while <FILE>;

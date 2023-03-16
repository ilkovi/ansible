#!/usr/bin/perl
use warnings;
use strict;


print "

open FILE, \">> extented.txt\" or die \$!;
my \$line = 1;
print FILE \"\\nNo, this is last one.\\n\";
close FILE;

open FILE, \"extented.txt\" or die \$!;
while (<FILE>) {
    print \$line++;
    print \": \$_\";
}


";


open FILE, ">> extented.txt" or die $!;
my $line = 1;
print FILE "\nNo, this is last one.\n";
close FILE;

open FILE, "extented.txt" or die $!;
while (<FILE>) {
    print $line++;
    print ": $_";
}

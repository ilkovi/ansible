#!/usr/bin/perl
use warnings;
use strict;

print "\n \n
 my \$in = shift;		# Read from \@ARGV - get first file name

 my \$out = shift;		# #Read from \@ARGV - get second file name


				# Terminate program if frst file name not defined
 die \"Supply file name\\n.\" if (not defined \$in);
 open IN, \$in or die \"Can't open file :\$!\";


				# If output defined we open it, else we redirect output to STDOUT
 if (defined \$out){
     open OUT,\">\$out\" or die \"Can't write to file: \$!\";
     } else { *OUT = *STDOUT;}

				# Here we coping data
 while (<IN>) {
     print OUT \$_;
 }				#End of program


";

my $in = shift;
my $out = shift;

die "Supply file name\n." if (not defined $in);
open IN, $in or die "Can't open file :$!";

if (defined $out){
    open OUT,">$out" or die "Can't write to file: $!";
    } else { *OUT = *STDOUT;}

while (<IN>) {
    print OUT $_;
}

#!/usr/bin/perl
#ex15.plx
use warnings;
use strict;
my $fruit = 3;
print qw(
        apple   strawberry  peach
        orange  grapes      plurn
    )[$fruit];

print " ---    pritn qw(apple   strawberry  peach orange  grapes plurn)[\$key]=3;	\n ";

# access an list element

print (('apple','grapes','peach')[1]); print "  ---  print (('apple','grapes','peach')[1]); \n";

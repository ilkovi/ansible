#!/usr/bin/perl
use warnings;
use strict;


print "

my \%city = (
        Ivan => \"Sofia\",
        Petko => \"Plovdiv\",
        Josh => \"Dalas\"
        );
for (keys \%city){
    print \"\$_ lives in \$city{\$_}.\\n\";
    }

";



my %city = (
        Ivan => "Sofia",
        Petko => "Plovdiv",
        Josh => "Dalas"
        );
for (keys %city){
    print "$_ lives in $city{$_}.\n";
    }

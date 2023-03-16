#!/usr/bin/perl
#ex15.plx
use warnings;
use strict;


my %city = (
        "Ivan"  ,"Sofia",
        "Petko" ,"Plovdiv",
        "Josh"  ,"Dalas",
        );


# vtori nachin za deklarirane na hash
my %telefon = (
        Ivan => "444 444 444",
        Petko => "333 433 232",
        Josh => "438 649 943"
        );

print " Towa e hash : ", %city ," \n";

print " Tova e hash : ",%telefon ,"\n";

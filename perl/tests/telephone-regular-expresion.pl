#!/usr/bin/perl
use strict;

my @phone_number;
my $digit_only;
my @array = ("212-555-1212",
"(212)555-1213",
"1-(212)-555-1214",
"1-212-555-1215",
"212 555 1216",
"(212) 555 1217",
"1 (212) 555 1218",
"1 212 555 1219",
"12125551210");

	foreach ( @array ) {
		
	print "$_ \n";
	@phone_number = $_ =~ m|(1)?-?\s?\(?(\d{3})\)?-?\s?(\d+)-?\s?(\d+)|;
	print "Parsed number :@phone_number \n";

	$digit_only=join ('', @phone_number);
	print "Digits only : $digit_only \n\n";
	
	}

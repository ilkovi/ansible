#!/usr/bin/perl
 use warnings;
 use strict;

print "

 \$_ = \"2011064\";
 tr/0123456789/abcdefghij/;
 print \$_,\"\n\";


";


 $_ = "2011064";
 tr/0123456789/abcdefghij/;
 print $_,"\n";


print "
	# Delete a simobol with trim ,with d option. If there is no d - nothing happen.
		tr/a//d;
		print \$_,\"\n\";

		";

tr/a//d;
print $_,"\n";



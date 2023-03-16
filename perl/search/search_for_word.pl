#!/usr/bin/perl
 use warnings;

print "	\n \t # Example of m/(\\w+)/ , tova pazi reszultata v promenliva \$1

	\$_ = \"ADE Date and Day\";

	m/(\\w+)/;

	print \$1 ;


";

$_ = "ADE Date and Day";

m/(\w+)/;

print $1."\n" ;

print "

	print \"Imame pone  3 dumi\" if m/(\\w+\\s+){3}/;

";

print "Imame pone  3 dumi" if m/(\w+\s+){3}/;

print "\n \n ";


print " \t # primer za vsqka duma 

 while (m/(\\w+)/g) {
 print(\"\$1\\n\");
 }

";

 while (m/(\w+)/g) {
 print("$1\n");
 }



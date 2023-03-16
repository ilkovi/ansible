#!/usr/bin/perl
 use warnings;
 use strict;

print "

 my \$scalar = \"The root has many leaves\";
 my \$match = \$scalar =~ m/root/;
 my \$substitution = \$scalar =~ s/root/tree/;
 my \$translate = \$scalar =~ tr/e/E/;

 print(\"\$match = \$match\\n\");
 print(\"\$substitution = \$substitution\\n\");
 print(\"\$translate = \$translate\\n\");
 print(\"\$scalar = \$scalar\\n\");

 \n 
";


 my $scalar = "The root has many leaves";
 my $match = $scalar =~ m/root/;
 my $substitution = $scalar =~ s/root/tree/;
 my $translate = $scalar =~ tr/e/E/;

 print("\$match = $match\n");
 print("\$substitution = $substitution\n");
 print("\$translate = $translate\n");
 print("\$scalar = $scalar\n");

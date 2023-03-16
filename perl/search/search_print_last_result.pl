#!/usr/bin/perl
 use warnings;
 use strict;

print "	\n \t # primer s .* . e za vsi4ko nez nov red. \$& e posledniq niz koito e bil nameren

 \$_ = '/user/Jackie/temp/names.dat';
 m/.*/;
 print \$&;


";


 $_ = '/user/Jackie/temp/names.dat';
 m/.*/;
 print $&;


print " \n \n \t # primer za premahvane na lakomoto  povedenie na perl sys ?

 m/.*?/;
 print \$&.\"null\";

";

 m/.*?/;
 print $&."null";



print " \n ";



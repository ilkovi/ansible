#!/usr/bin/perl
use warnings;
use strict;


print "\n \n \t # vmesto argv pi6em <> \n
	Tova e podhodq6to pri rabota s malki failove, za6toto te se 4etata i prehvyrlqt v pametta na pc-to .
	Za golemi failove e dobre da se 4etat red po red !!! \n

	Moje da definirame , kak perl da 4ete text-a , po default toi izpolzva kraq na red \\n - koeto se definirano v \$/ 
	\$/ = \"\"  - tova 6te nakara perl da 4ete text-a paragraf  po paragraf
	\$/ = undef - a towa 6te nakara perl da pro4ete text-a kato edin niz 


my \$line = 1;

while (<>) {
          print \$line++;
          print \": \$_\";
}


";




my $line = 1;

while (<>) {
          print $line++;
          print ": $_";
}

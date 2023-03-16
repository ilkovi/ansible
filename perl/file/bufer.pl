#!/usr/bin/perl
 use warnings;
 use strict;

print " \n
	Moje bi o4akvate perl da napravi 5 . prez interval ot 1 sec. - samo pod Win

	Pri drugite OS , 6te trqbva da iz4aka 5 sec , predi da izkara vsi4ki to4ki na vednyj

	tova se pravi s cel optimizirane na diskovite operacii .

	Za da se promeni tova, trqbva da se promeni slujebnata promenliva \$| na 1

	Ako \$| e 0 - buferiranoto e vkliu4eno.

 for (1 .. 5){
 print \".\";
 sleep 1;
 }
 print \"\\n\";

";

 for (1 .. 5){
 print ".";
 sleep 1;
 }
 print "\n";

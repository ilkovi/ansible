#!/usr/bin/perl
 #ex24.plx
 use warnings;
 use strict;

 my $key = "";
 my $value = "";
 my $place = "Dalas";

 my %city = (
 Ivan => "Sofia",
 Petko => "Plovdiv",
 Josh => "Dalas",
 Juana => "Sofia"
 );

# trqbva da se vnimava, za6toto moje da ima dva kliu4a s edno ime i tova vodi do zaguba na informaciq
 my %people = reverse %city;

 print "Ivan lives in ",$city{Ivan},"\n";
 print "$people{$place} lives in $place\n";



# Hash-a kakto sme go vyveli v nachaloto

print "# Defaut Hash #################### \n";

while (($key, $value) = each(%city)){
     print "# \t", $key. " ---  ".$value. " \t # \n";
}

print "################################## \n";





# Add na element kym hasha

$city{Maria} = "Varna";



# LOOP THROUGH IT

print "# Add record #####################  \$city{Maria} = \"Varna\"\n";

while (($key, $value) = each(%city)){
     print "# \t", $key. " ---  ".$value. " \t # \n";
}

print "################################## \n";




# Delete a record by key

delete $city{Josh};




# LOOP THROUGH IT

print "# Delete record ##################   delete \$city{Josh} \n";

while (($key, $value) = each(%city)){
     print "# \t", $key. " ---  ".$value. " \t # \n";
}

print "################################## \n";



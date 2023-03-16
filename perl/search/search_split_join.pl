#!/usr/bin/perl
 use warnings;
 use strict;

print "

 \$_ = \"There is a big dog here\";
 my \@splitedString = split;
 foreach (\@splitedString){
 print \$_,\"\\n\";
 }
 my \$newstring = join(\" \",\@splitedString);
 print \$newstring,\"\\n\";


";



 $_ = "There is a big dog here";
 my @splitedString = split;
 foreach (@splitedString){
 print $_,"\n";
 }
 
 my $newstring = join (" ", @splitedString );
 print $newstring," \n";


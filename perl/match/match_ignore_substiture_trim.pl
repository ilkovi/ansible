#!/usr/bin/perl
 use warnings;
 use strict;

print " \n \t # Example with ingmore symbol syze

 \$_ = \"SOME TEXT TO SEARCH\";
 print \"Ok.I found it.\\n\" if /text/i;


";

 $_ = "SOME TEXT TO SEARCH";
 print "Ok.I found it.\n" if /text/i;



print "\n \n \t # Example with substitute

 \$_ = \"Some text to search\";
 my \$oldtext = \"serach\";
 my \$newtext = \"substitute\";
 my \$result = s/\$oldtext/\$newtext/;
 print \$_,\"\n\";

";


# $_ = "Some text to search";
 my $oldtext = "SEARCH";
 my $newtext = "substitute";
 my $result = s/$oldtext/$newtext/i;
 print  $_ ,"\n";




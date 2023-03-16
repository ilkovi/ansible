#!/usr/bin/perl
use warnings;
use strict;

print "

my \$input = \"ok\";
while (\$input ne \"quit\"){
    print 'Type \"quit\" to exit:';
    \$input = <STDIN>;
    chomp \$input; 	--- maha \\n ot stdin
}


";

my $input = "ok";
while ($input ne "quit"){
    print 'Type "quit" to exit:';
    $input = <STDIN>;
    chomp $input;
}

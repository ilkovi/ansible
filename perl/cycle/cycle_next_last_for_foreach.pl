#!/usr/bin/perl
 use warnings;
 use strict;

print "     \t #  While Example \n

 my \$num = 0;
 print \"\$num \" while ++\$num < 10;

";

 my $num = 0;
 print "$num " while ++$num < 10;


print "\n \n \n   \t #   SKiP even digits";

print "

 my \@numbers = (1 .. 10);
 foreach (\@numbers) {
     print \"\$_ \" if ((\$_%2)==0);
}


";


 my @numbers = (1 .. 10);
 foreach (@numbers) {
     print "$_ " if (($_%2)==0);
}

print "\n \n \n";




print "\n \n  \t# Spirane na cikyl s \"LAST\"";

print "

my \@numbers = (1 .. 10);
foreach (\@numbers) {
    last if (\$_ == 5);
    print \"\$_ \";
}


";

#my @numbers = (1 .. 10);
foreach (@numbers) {
    last if ($_ == 5);
    print "$_ ";
}




print "\n";


print "\n \n  \t#  Propuskane na iteraciq ot cikyl s  \"next\"";


print "

 my \@numbers = (1 .. 5);
 foreach (\@numbers) {
    if ((\$_%2) == 0) {
        print \"Skipping even element.\\n\";
        next;
    }
    print \"\$_\\n\";
 }

";


#my @numbers = (1 .. 5);
foreach (@numbers) {
    if (($_%2) == 0) {
        print "Skipping even element.\n";
        next;
    }
    print "$_\n";
 }


print "\n";


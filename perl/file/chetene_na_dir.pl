#!/usr/bin/perl
use warnings;
use strict;


print "\n \n 

print \"Contents of the curren directory:\\n\";
opendir DIR,\".\" or die \$!;
while (\$_ = readdir(DIR)){
        next if \$_ eq \".\" or \$_ eq \"..\";
                print \$_,\" \" x (30 - length(\$_));
                        print \"d\" if -d \$_;
                        print \"r\" if -r _;	# _ se izpolzva za failovi proverki - tova e default manipolatora , pravi stat :)
                        print \"w\" if -w _;
                        print \"x\" if -x _;
                        print \"o\" if -o _;
                        print \"\\t\";
                        print -s _ if -r _ and -f _;	# tova printira goleminata na faila v baitove
                        print \"\\n\";
                        }


";




print "Contents of the curren directory:\n";
opendir DIR,"." or die $!;
while ($_ = readdir(DIR)){
	next if $_ eq "." or $_ eq "..";
		print $_," " x (30 - length($_));
			print "d" if -d $_;
			print "r" if -r _;
			print "w" if -w _;
			print "x" if -x _;
			print "o" if -o _;
			print "\t";
			print -s _ if -r _ and -f _;
			print "\n";
			}

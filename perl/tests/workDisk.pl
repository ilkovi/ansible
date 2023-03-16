#!/usr/bin/perl
use strict;

my $diskList= "1:2:3:4:5:6:7:8:9:10:11:12:13:14:15:16:17:18:19:20:21:22";
my @array = split (':', $diskList);
my @mdisk_set ;

while( my @list = splice( @array, 0, 8 ) ) {
#print join(':', @list), "\n";
    push @mdisk_set, join(':', @list);
}


#push @mdisk_set, [ splice @array, 0, 8 ] while @array;

foreach my $test (@mdisk_set) {
	print "L $test \n";
}

undef @array;

#!/usr/bin/perl
 use warnings;
 use strict;

print "

m/example/ 		--- return true or false

s/example/new_text/ 	--- substite

tr/symbol/new_symbol/ 	--- change symbols


Options 
	g	- global search in whole string - many rows
	i	- ignore symbol size
	m	- string is from many rows
	o	- once - only one match
	s	- single row , Perl do only first row
	x	- use # comments and empty rows


 # primer s izpolzvane na  //
	m/\\/root/\\home\\/file.txt/

  # sy6toto no s alternativen razdelitel
 	m{/root/home/file.txt}

 # sravnenie chrez promenliva 
 	my \$path = '/root/home/file.txt';
 	m/\$path/;

 # pylen zapis
	 print \"Ok.I found it.\\n\" if m\/text\/;

 # sykraten zapis
	 print \"Ok.I found it.\\n\" if /text/;

\n \n \n

 \$_ = \"Some text to search\";
 print \"Ok.I found it.\\n\" if m/text/;

\n
";


 $_ = "Some text to search";
 print "Ok.I found it.\n" if m/text/;

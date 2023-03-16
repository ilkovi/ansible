#!/usr/bin/perl


open(OUT,">>/etc/httpd/conf/httpd.conf");
print OUT "\n\n<VirtualHost 192.168.0.200:80>\n";
print OUT "\tDocumentRoot /data/hosting/$ARGV[0]/public_html\n";
print OUT "\tServerName $ARGV[0]\n";
print OUT "\tServerAlias www.$ARGV[0]\n";
print OUT "\tServerAlias *.$ARGV[0]\n";
print OUT "\tErrorLog logs/$ARGV[0]-error_log\n";
print OUT "\tCustomLog logs/$ARGV[0]-access_log common\n";
print OUT "</VirtualHost>\n";
close(OUT);


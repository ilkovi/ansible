#!/usr/bin/perl -w


use strict;
use XML::DOM;

my $file = $ARGV[0];
my $string = $ARGV[1];
my $parser = XML::DOM::Parser->new();


sub PrintSiteMaster {
my $doc = $parser->parsefile($file);
        foreach my $species ($doc->getElementsByTagName('VM')){
            print $species->getElementsByTagName('ip')->item(0)->getFirstChild->getNodeValue;
            print " ".$species->getElementsByTagName('hostname')->item(0)->getFirstChild->getNodeValue.".";
            print $species->getElementsByTagName('domain')->item(0)->getFirstChild->getNodeValue;
            print " ".$species->getElementsByTagName('hostname')->item(0)->getFirstChild->getNodeValue;
            print "  # MACH=".$species->getElementsByTagName('type')->item(0)->getFirstChild->getNodeValue;
            print "\n";
        }
}

sub PrintVMList {
my $doc = $parser->parsefile($file);
print "ip\t\thostn\t\t\tnetmask\t\tgateway\t\tcpu\tmem\tesxi\t\tsource\t\t\tdev\tname\n";
        foreach my $species ($doc->getElementsByTagName('VM')){
	  foreach my $species2 ($species->getElementsByTagName('network')){
	      print $species2->getElementsByTagName('ip')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('hostname')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species2->getElementsByTagName('netmask')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('gateway')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('cpu')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('memory')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('esxi')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('clone_source')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species2->getElementsByTagName('device')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species2->getElementsByTagName('name')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species2->getElementsByTagName('nodename')->item(0)->getFirstChild->getNodeValue;
	      print "\n";
          }
	}
}

sub Print_oldformat_VMList {
my $doc = $parser->parsefile($file);
print "ip\t\thostn\tnetmask\t\tgateway\t\tcpu\tmem\tesxi\t\tsource\thome_size \n";
        foreach my $species ($doc->getElementsByTagName('VM')){
	      print $species->getElementsByTagName('ip')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('hostname')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('netmask')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('gateway')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('cpu')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('memory')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('esxi')->item(0)->getFirstChild->getNodeValue;
	      print "\t".$species->getElementsByTagName('clone_source')->item(0)->getFirstChild->getNodeValue;
	      foreach my $species3 ($species->getElementsByTagName('filesystem')){
	            print "\t".$species3->getElementsByTagName('name')->item(0)->getFirstChild->getNodeValue;
	            print "=".$species3->getElementsByTagName('size')->item(0)->getFirstChild->getNodeValue;
	      }
	      print "\n";
        }
}


sub PrintESXi {
my $doc = $parser->parsefile($file);
print "hostn\tvn_ip\t\tvn_mask\t\tvn_gtwt\t\tnas_ip\t\tnas_mask\tnas_gtw\n";
        foreach my $species ($doc->getElementsByTagName('server')){
            print $species->getElementsByTagName('name')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('vn_ip')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('vn_netmask')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('vn_gateway')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('nas_ip')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('nas_netmask')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('nas_gateway')->item(0)->getFirstChild->getNodeValue;
            print "\n";
        }
}


sub PrintNFS {
my $doc = $parser->parsefile($file);
print "#ip\t\thostname\t\tnfs_option\t\t\t\tnfs_server\tvolume\tnfs_mount \n";
    foreach my $species ($doc->getElementsByTagName('VM')){
        foreach my $species2 ($species->getElementsByTagName('nfs')){
            print $species->getElementsByTagName('ip')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species->getElementsByTagName('hostname')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species2->getElementsByTagName('nfs_option')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species2->getElementsByTagName('nfs_server')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species2->getElementsByTagName('nfs_volume')->item(0)->getFirstChild->getNodeValue;
            print "\t".$species2->getElementsByTagName('nfs_mount')->item(0)->getFirstChild->getNodeValue;
            print "\n";
        }
    }
}

sub Usage_Error {
        print "\nError: Incorect usage!\n$0 filename.xml {sitemaster|vmlist|nfs|esxi}\n\n";
        exit 1;
}

if ($#ARGV != 1) {
   Usage_Error;
}
if ($string eq 'sitemaster') {
        PrintSiteMaster;
}
elsif ($string eq 'vmlist') {
        PrintVMList;
}
elsif ($string eq 'esxi') {
        PrintESXi;
}
elsif ($string eq 'nfs') {
        PrintNFS;
}
elsif ($string eq 'oldvmlist') {
	Print_oldformat_VMList;
}

else {
    Usage_Error;
}

## END ##################


#!/usr/bin/perl

use LWP::UserAgent;

         $ua = LWP::UserAgent->new;
         $ua->agent("MyApp/0.1 ");

       my $req = HTTP::Request->new(GET => 'http://some-site.bg/SESP/Exams.html');
                                                       my $res = $ua->request($req);
         #
     if ($res->is_success) {
				$data = $res->content;
                           }
     else {
           print $res->status_line, "\n";
          }


if($data) {

@my_data = split(/\n/,$data);

foreach $line (@my_data) {
	chomp($line);
	if($line =~ m/new1.gif/ )  { 

print " $line\n";

	}
}

}

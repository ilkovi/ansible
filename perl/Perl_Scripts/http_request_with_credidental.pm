
#!/usr/bin/perl

our $path="/root/radio";
our $server;
our $port;
our $username;
our $password;
our $realm;

#our @points;

require("$path/radio.conf");


use LWP::UserAgent;

         $ua = LWP::UserAgent->new;
         $ua->agent("MyApp/0.1 ");

$ua->credentials(
    "$server:$port",
    $realm,
    $username  => $password
  );

       my $req = HTTP::Request->new(GET => "http://$server:$port/admin/listmounts.xsl");
          my $res = $ua->request($req);
        #
      if ($res->is_success) {
        $data = $res->content;
      }
      else {
         print $res->status_line, "\n";
      }

print $data;


#!env perl
use warnings;
use strict;

my $interface = shift;
system(thrift => '--gen' => perl => $interface)
    && die "Thrift generation error: $!";

system "perl -p -i -e 's/Cassandra::/Net::Cassandra::Backend::/g;' gen-perl/Cassandra/*.pm";
mkdir 'lib/Net/Cassandra/Backend';
system "cp gen-perl/Cassandra/Types.pm lib/Net/Cassandra/Backend";
system "cp gen-perl/Cassandra/Constants.pm lib/Net/Cassandra/Backend";
system "cp gen-perl/Cassandra/Cassandra.pm lib/Net/Cassandra/Backend.pm";
system "rm -r ./gen-perl";

#!env perl
use warnings;
use strict;

my $interface = shift;
system(thrift => '--gen' => perl => $interface)
    && die "Thrift generation error: $!";

system "perl -p -i -e 's/Cassandra::/Net::Cassandra::Backend::/g; s/Thrift::TException/Net::Cassandra::Backend::Thrift::TException/g; s/use Thrift/use Net::Cassandra::Backend::Thrift/g' gen-perl/Cassandra/*.pm";
system "cp gen-perl/Cassandra/*.pm lib/Net/Cassandra/";

#!perl
use strict;
use warnings;
use ExtUtils::MakeMaker;

my $interface = '/usr/share/cassandra/interface.thrift';
if (-f $interface) {
    print "Using $interface to mangle namespaces\n";
    system('mangle-thrift.pl', '/usr/share/cassandra/interface.thrift');
}
else {
    print "Missing $interface this will probably fail somewhere :)\n";
}

WriteMakefile(
    NAME         => 'Net::Cassandra',
    VERSION_FROM => 'lib/Net/Cassandra.pm',
    ABSTRACT     => 'Interface to Cassandra',
    AUTHOR       => 'Leon Brocard <acme@astray.com>',
    LICENSE      => 'perl',
    PREREQ_PM    => {
        'Moose'                     => '0',
        'MooseX::StrictConstructor' => '0',
    }
);


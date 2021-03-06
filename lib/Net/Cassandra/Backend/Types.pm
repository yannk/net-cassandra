#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#
require 5.6.0;
use strict;
use warnings;
use Net::Cassandra::Backend::Thrift;

package Net::Cassandra::Backend::ConsistencyLevel;
use constant ZERO => 0;
use constant ONE => 1;
use constant QUORUM => 2;
use constant DCQUORUM => 3;
use constant DCQUORUMSYNC => 4;
use constant ALL => 5;
package Net::Cassandra::Backend::Column;
use base qw(Class::Accessor);
Net::Cassandra::Backend::Column->mk_accessors( qw( name value timestamp ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{name} = undef;
  $self->{value} = undef;
  $self->{timestamp} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{name}) {
      $self->{name} = $vals->{name};
    }
    if (defined $vals->{value}) {
      $self->{value} = $vals->{value};
    }
    if (defined $vals->{timestamp}) {
      $self->{timestamp} = $vals->{timestamp};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'Column';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{name});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{value});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::I64) {
        $xfer += $input->readI64(\$self->{timestamp});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('Column');
  if (defined $self->{name}) {
    $xfer += $output->writeFieldBegin('name', Net::Cassandra::Backend::TType::STRING, 1);
    $xfer += $output->writeString($self->{name});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{value}) {
    $xfer += $output->writeFieldBegin('value', Net::Cassandra::Backend::TType::STRING, 2);
    $xfer += $output->writeString($self->{value});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{timestamp}) {
    $xfer += $output->writeFieldBegin('timestamp', Net::Cassandra::Backend::TType::I64, 3);
    $xfer += $output->writeI64($self->{timestamp});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::SuperColumn;
use base qw(Class::Accessor);
Net::Cassandra::Backend::SuperColumn->mk_accessors( qw( name columns ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{name} = undef;
  $self->{columns} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{name}) {
      $self->{name} = $vals->{name};
    }
    if (defined $vals->{columns}) {
      $self->{columns} = $vals->{columns};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'SuperColumn';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{name});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::LIST) {
        {
          my $_size0 = 0;
          $self->{columns} = [];
          my $_etype3 = 0;
          $xfer += $input->readListBegin(\$_etype3, \$_size0);
          for (my $_i4 = 0; $_i4 < $_size0; ++$_i4)
          {
            my $elem5 = undef;
            $elem5 = new Net::Cassandra::Backend::Column();
            $xfer += $elem5->read($input);
            push(@{$self->{columns}},$elem5);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('SuperColumn');
  if (defined $self->{name}) {
    $xfer += $output->writeFieldBegin('name', Net::Cassandra::Backend::TType::STRING, 1);
    $xfer += $output->writeString($self->{name});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{columns}) {
    $xfer += $output->writeFieldBegin('columns', Net::Cassandra::Backend::TType::LIST, 2);
    {
      $output->writeListBegin(Net::Cassandra::Backend::TType::STRUCT, scalar(@{$self->{columns}}));
      {
        foreach my $iter6 (@{$self->{columns}}) 
        {
          $xfer += ${iter6}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::ColumnOrSuperColumn;
use base qw(Class::Accessor);
Net::Cassandra::Backend::ColumnOrSuperColumn->mk_accessors( qw( column super_column ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{column} = undef;
  $self->{super_column} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{column}) {
      $self->{column} = $vals->{column};
    }
    if (defined $vals->{super_column}) {
      $self->{super_column} = $vals->{super_column};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'ColumnOrSuperColumn';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRUCT) {
        $self->{column} = new Net::Cassandra::Backend::Column();
        $xfer += $self->{column}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRUCT) {
        $self->{super_column} = new Net::Cassandra::Backend::SuperColumn();
        $xfer += $self->{super_column}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('ColumnOrSuperColumn');
  if (defined $self->{column}) {
    $xfer += $output->writeFieldBegin('column', Net::Cassandra::Backend::TType::STRUCT, 1);
    $xfer += $self->{column}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{super_column}) {
    $xfer += $output->writeFieldBegin('super_column', Net::Cassandra::Backend::TType::STRUCT, 2);
    $xfer += $self->{super_column}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::NotFoundException;
use base qw(Net::Cassandra::Backend::Thrift::TException);
use base qw(Class::Accessor);

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  return bless ($self, $classname);
}

sub getName {
  return 'NotFoundException';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('NotFoundException');
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::InvalidRequestException;
use base qw(Net::Cassandra::Backend::Thrift::TException);
use base qw(Class::Accessor);
Net::Cassandra::Backend::InvalidRequestException->mk_accessors( qw( why ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{why} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{why}) {
      $self->{why} = $vals->{why};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'InvalidRequestException';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{why});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('InvalidRequestException');
  if (defined $self->{why}) {
    $xfer += $output->writeFieldBegin('why', Net::Cassandra::Backend::TType::STRING, 1);
    $xfer += $output->writeString($self->{why});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::UnavailableException;
use base qw(Net::Cassandra::Backend::Thrift::TException);
use base qw(Class::Accessor);

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  return bless ($self, $classname);
}

sub getName {
  return 'UnavailableException';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('UnavailableException');
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::TimedOutException;
use base qw(Net::Cassandra::Backend::Thrift::TException);
use base qw(Class::Accessor);

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  return bless ($self, $classname);
}

sub getName {
  return 'TimedOutException';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('TimedOutException');
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::ColumnParent;
use base qw(Class::Accessor);
Net::Cassandra::Backend::ColumnParent->mk_accessors( qw( column_family super_column ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{column_family} = undef;
  $self->{super_column} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{column_family}) {
      $self->{column_family} = $vals->{column_family};
    }
    if (defined $vals->{super_column}) {
      $self->{super_column} = $vals->{super_column};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'ColumnParent';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^3$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{column_family});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{super_column});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('ColumnParent');
  if (defined $self->{column_family}) {
    $xfer += $output->writeFieldBegin('column_family', Net::Cassandra::Backend::TType::STRING, 3);
    $xfer += $output->writeString($self->{column_family});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{super_column}) {
    $xfer += $output->writeFieldBegin('super_column', Net::Cassandra::Backend::TType::STRING, 4);
    $xfer += $output->writeString($self->{super_column});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::ColumnPath;
use base qw(Class::Accessor);
Net::Cassandra::Backend::ColumnPath->mk_accessors( qw( column_family super_column column ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{column_family} = undef;
  $self->{super_column} = undef;
  $self->{column} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{column_family}) {
      $self->{column_family} = $vals->{column_family};
    }
    if (defined $vals->{super_column}) {
      $self->{super_column} = $vals->{super_column};
    }
    if (defined $vals->{column}) {
      $self->{column} = $vals->{column};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'ColumnPath';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^3$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{column_family});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{super_column});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^5$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{column});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('ColumnPath');
  if (defined $self->{column_family}) {
    $xfer += $output->writeFieldBegin('column_family', Net::Cassandra::Backend::TType::STRING, 3);
    $xfer += $output->writeString($self->{column_family});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{super_column}) {
    $xfer += $output->writeFieldBegin('super_column', Net::Cassandra::Backend::TType::STRING, 4);
    $xfer += $output->writeString($self->{super_column});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{column}) {
    $xfer += $output->writeFieldBegin('column', Net::Cassandra::Backend::TType::STRING, 5);
    $xfer += $output->writeString($self->{column});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::SliceRange;
use base qw(Class::Accessor);
Net::Cassandra::Backend::SliceRange->mk_accessors( qw( start finish reversed count ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{start} = undef;
  $self->{finish} = undef;
  $self->{reversed} = 0;
  $self->{count} = 100;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{start}) {
      $self->{start} = $vals->{start};
    }
    if (defined $vals->{finish}) {
      $self->{finish} = $vals->{finish};
    }
    if (defined $vals->{reversed}) {
      $self->{reversed} = $vals->{reversed};
    }
    if (defined $vals->{count}) {
      $self->{count} = $vals->{count};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'SliceRange';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{start});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{finish});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^3$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::BOOL) {
        $xfer += $input->readBool(\$self->{reversed});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^4$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::I32) {
        $xfer += $input->readI32(\$self->{count});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('SliceRange');
  if (defined $self->{start}) {
    $xfer += $output->writeFieldBegin('start', Net::Cassandra::Backend::TType::STRING, 1);
    $xfer += $output->writeString($self->{start});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{finish}) {
    $xfer += $output->writeFieldBegin('finish', Net::Cassandra::Backend::TType::STRING, 2);
    $xfer += $output->writeString($self->{finish});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{reversed}) {
    $xfer += $output->writeFieldBegin('reversed', Net::Cassandra::Backend::TType::BOOL, 3);
    $xfer += $output->writeBool($self->{reversed});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{count}) {
    $xfer += $output->writeFieldBegin('count', Net::Cassandra::Backend::TType::I32, 4);
    $xfer += $output->writeI32($self->{count});
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::SlicePredicate;
use base qw(Class::Accessor);
Net::Cassandra::Backend::SlicePredicate->mk_accessors( qw( column_names slice_range ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{column_names} = undef;
  $self->{slice_range} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{column_names}) {
      $self->{column_names} = $vals->{column_names};
    }
    if (defined $vals->{slice_range}) {
      $self->{slice_range} = $vals->{slice_range};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'SlicePredicate';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::LIST) {
        {
          my $_size7 = 0;
          $self->{column_names} = [];
          my $_etype10 = 0;
          $xfer += $input->readListBegin(\$_etype10, \$_size7);
          for (my $_i11 = 0; $_i11 < $_size7; ++$_i11)
          {
            my $elem12 = undef;
            $xfer += $input->readString(\$elem12);
            push(@{$self->{column_names}},$elem12);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRUCT) {
        $self->{slice_range} = new Net::Cassandra::Backend::SliceRange();
        $xfer += $self->{slice_range}->read($input);
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('SlicePredicate');
  if (defined $self->{column_names}) {
    $xfer += $output->writeFieldBegin('column_names', Net::Cassandra::Backend::TType::LIST, 1);
    {
      $output->writeListBegin(Net::Cassandra::Backend::TType::STRING, scalar(@{$self->{column_names}}));
      {
        foreach my $iter13 (@{$self->{column_names}}) 
        {
          $xfer += $output->writeString($iter13);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{slice_range}) {
    $xfer += $output->writeFieldBegin('slice_range', Net::Cassandra::Backend::TType::STRUCT, 2);
    $xfer += $self->{slice_range}->write($output);
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

package Net::Cassandra::Backend::KeySlice;
use base qw(Class::Accessor);
Net::Cassandra::Backend::KeySlice->mk_accessors( qw( key columns ) );

sub new {
  my $classname = shift;
  my $self      = {};
  my $vals      = shift || {};
  $self->{key} = undef;
  $self->{columns} = undef;
  if (UNIVERSAL::isa($vals,'HASH')) {
    if (defined $vals->{key}) {
      $self->{key} = $vals->{key};
    }
    if (defined $vals->{columns}) {
      $self->{columns} = $vals->{columns};
    }
  }
  return bless ($self, $classname);
}

sub getName {
  return 'KeySlice';
}

sub read {
  my ($self, $input) = @_;
  my $xfer  = 0;
  my $fname;
  my $ftype = 0;
  my $fid   = 0;
  $xfer += $input->readStructBegin(\$fname);
  while (1) 
  {
    $xfer += $input->readFieldBegin(\$fname, \$ftype, \$fid);
    if ($ftype == Net::Cassandra::Backend::TType::STOP) {
      last;
    }
    SWITCH: for($fid)
    {
      /^1$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::STRING) {
        $xfer += $input->readString(\$self->{key});
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
      /^2$/ && do{      if ($ftype == Net::Cassandra::Backend::TType::LIST) {
        {
          my $_size14 = 0;
          $self->{columns} = [];
          my $_etype17 = 0;
          $xfer += $input->readListBegin(\$_etype17, \$_size14);
          for (my $_i18 = 0; $_i18 < $_size14; ++$_i18)
          {
            my $elem19 = undef;
            $elem19 = new Net::Cassandra::Backend::ColumnOrSuperColumn();
            $xfer += $elem19->read($input);
            push(@{$self->{columns}},$elem19);
          }
          $xfer += $input->readListEnd();
        }
      } else {
        $xfer += $input->skip($ftype);
      }
      last; };
        $xfer += $input->skip($ftype);
    }
    $xfer += $input->readFieldEnd();
  }
  $xfer += $input->readStructEnd();
  return $xfer;
}

sub write {
  my ($self, $output) = @_;
  my $xfer   = 0;
  $xfer += $output->writeStructBegin('KeySlice');
  if (defined $self->{key}) {
    $xfer += $output->writeFieldBegin('key', Net::Cassandra::Backend::TType::STRING, 1);
    $xfer += $output->writeString($self->{key});
    $xfer += $output->writeFieldEnd();
  }
  if (defined $self->{columns}) {
    $xfer += $output->writeFieldBegin('columns', Net::Cassandra::Backend::TType::LIST, 2);
    {
      $output->writeListBegin(Net::Cassandra::Backend::TType::STRUCT, scalar(@{$self->{columns}}));
      {
        foreach my $iter20 (@{$self->{columns}}) 
        {
          $xfer += ${iter20}->write($output);
        }
      }
      $output->writeListEnd();
    }
    $xfer += $output->writeFieldEnd();
  }
  $xfer += $output->writeFieldStop();
  $xfer += $output->writeStructEnd();
  return $xfer;
}

1;

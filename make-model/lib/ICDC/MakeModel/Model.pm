package ICDC::MakeModel::Model;
use v5.10;
use lib '../../../lib';
use Carp qw/croak/;
use Log::Log4perl qw/:easy/;
use ICDC::MakeModel::Config;
use strict;

# new($make_model_object)
sub new {
  my $class = shift;
  my ($mm) = @_;
  my $self = {
    _nodes => {},
    _edges => [],
    _props => {},
    _edge_table => {},
   };
  bless $self, $class;
  my $ns = $mm->{_nodes};
  my $rs = $mm->{_relns};
  my $pds = $mm->input->{PropDefinitions};
  for (keys %$pds) {
    next unless $_;
    $self->{_props}{$_} = ICDC::MakeModel::Model::Property->new($_, $pds->{$_}, $self);
  }
  for (keys %$ns ) {
    next unless $_;
    $self->{_nodes}{$_} = ICDC::MakeModel::Model::Node->new($_,$ns->{$_},$self);
  }
  for my $t (keys %$rs ) {
    next unless $t;
    $self->{_edge_types}{$t} = ICDC::MakeModel::Model::EdgeType->new($t,$rs->{$t},$self);
    for my $e ( @{$rs->{$t}{Ends}} ) {
      next unless $e;
      push @{$self->{_edges}}, ICDC::MakeModel::Model::Edge->new($t,$e,$self);
    }
  }
  return $self;
}

sub node { $_[0]->{_nodes}{$_[1]} }
sub nodes { values %{shift->{_nodes}} }

sub prop { $_[0]->{_props}{$_[1]} }
sub props { values %{shift->{_props}} }

sub edge_types { values %{shift->{_edge_types}} }
sub edge_type { $_[0]->{_edge_types}{$_[1]} }

sub edges {  @{shift->{_edges}} }
sub edge {
  my $self = shift;
  my ($type,$src,$dst) = @_;
  $type = $type->name if ref $type;
  $src = $src->name if ref $src;
  $dst = $dst->name if ref $dst;
  return $self->{_edge_table}{$type}{$src}{$dst};
}

sub edge_by_src { shift->edges_by_src(@_) }
sub edge_by_dst { shift->edges_by_dst(@_) }
sub edge_by_type { shift->edges_by_type(@_) }

sub edges_by_src { shift->edge_by('src',@_) }
sub edges_by_dst { shift->edge_by('dst',@_) }
sub edges_by_type { shift->edge_by('type',@_) }

sub edge_by {
  my $self = shift;
  my ($key, $arg) = @_;
  unless ($key =~ /^src|dst|type$/) {
    FATAL "Model::edge_by() - arg 1 must be one of src|dst|type";
    exit 1;
  }
  if (ref $arg =~ /:Model:/) {
    $arg = $arg->name;
  }
  elsif (ref $arg) {
    FATAL "arg must be a ".__PACKAGE__."-related object or string, not ".ref($arg);
    exit 1;
  }
  my @ret;
  for ($key) {
    /^src$/ && do {
      for my $t (keys %{$self->{_edge_table}}) {
        for my $u (keys %{$self->{_edge_table}{$t}{$arg}}) {
          push @ret, $self->{_edge_table}{$t}{$arg}{$u};
        }
      }
      last;
    };
    /^dst$/ && do {
      for my $t (keys %{$self->{_edge_table}}) {
        for my $u (keys %{$self->{_edge_table}{$t}}) {
          push @ret, $self->{_edge_table}{$t}{$u}{$arg};
        }
      }
      last;
    };
    /^type$/ && do {
      for my $t (keys %{$self->{_edge_table}{$arg}}) {
        for my $u (keys %{$self->{_edge_table}{$arg}{$t}}) {
          push @ret, $self->{_edge_table}{$arg}{$t}{$u};
        }
      }
      last;
    };
  }
  return @ret;
}
1;

package ICDC::MakeModel::Model::Node;
use Log::Log4perl qw/:easy/;
use strict;

sub new {
  my $class = shift;
  my ($name, $info, $model) = (@_);
  my $self = {
    _tags => [],
    _name => undef,
    _category => undef, 
    _props => {},
   };
  bless $self, $class;
  ($self->{_name}) = $name;
  if ($info->{Tags}) {
    $self->{_tags} = $info->{Tags} 
  }
  if ($info->{Category}) {
    $self->{_category} = $info->{Category};
  }
  for my $p (@{ $info->{Props} }) {
    $self->{_props}{$p} = $model->prop($p) || ICDC::MakeModel::Model::Property->new($p,undef,$model);
  }
  return $self;
}

sub name { shift->{_name} }
sub category { shift->{_category} }
sub props { values %{shift->{_props}} }
sub prop { $_[0]->{_props}{$_[1]} }
sub tags { @{shift->{_tags}} }

             
1;

package ICDC::MakeModel::Model::Property;
use Log::Log4perl qw/:easy/;
use Clone qw/clone/;
use strict;

sub new {
  my $class = shift;
  my ($name, $propdef, $model) = (@_);
  my $self = {
    _type => undef,
    _tags => [],
    _values => undef,
    _propdef => {}
   };
  bless $self, $class;
  $self->{_name} = $name;
  if ($propdef) {
    $self->{_propdef} = clone($propdef); # grab everything for later
    if ($propdef->{Tags}) {
      $self->{_tags} = $propdef->{Tags};
    }
    $self->{_type} = $propdef->{Type} && (ref $propdef->{Type} ? ref $propdef->{Type} :
                                            $propdef->{Type});
    unless ( $self->{_type} ) {
      WARN "Property '$name' has no Type defined";
    }
    # below -- should call STS to get list if appropriate
    $self->{_values} = ($self->{_type} eq 'ARRAY' ? [@{$propdef->{Type}}] : undef );
  }
  else {
    WARN "Property '$name' does not have a PropDefinitions entry";
    $model->{_props}{$name} = $self;
  }
  return $self
}

sub tags { @{shift->{_tags}} }
sub type { shift->{_type} }
sub values { $_[0]->{_values} && (ref $_[0]->{_values} eq 'ARRAY' ? @{$_[0]->{_values}} : ($_[0]->{_values})) }
sub name { shift->{_name} }
sub is_required { shift->{_propdef}{Req} }
1;

package ICDC::MakeModel::Model::EdgeType;
use Log::Log4perl qw/:easy/;
use Clone qw/clone/;
use strict;

sub new {
  my $class = shift;
  my ($type, $info, $model) = @_;
  my $self = {
    _name => undef,
    _tags => [],
    _props => {},
    _ends => [],
    _edgedef => {},
   };
  bless $self, $class;
  $self->{_name} = $type;
  if ($info->{Tags}) {
    $self->{_tags} = $info->{Tags};
  }
  for my $p (@{ $info->{Props} }) {
    $self->{_props}{$p} = $model->prop($p) || ICDC::MakeModel::Model::Property->new($p,undef,$model);
  }
  $self->{_edgedef} = clone( $info );
  for (@{$info->{Ends}}) {
    my $src = $_->{Src};
    my $dst = $_->{Dst};
    WARN "No 'Src' in 'Ends' entry for edge type '$type'" unless ($src);
    WARN "No 'Dst' in 'Ends' entry for edge type '$type'" unless ($dst);
    if ($model->node($src)) {
      $src = $model->node($src);
    }
    else {
      WARN "No source node '$src' defined in Nodes for Ends entry in edge type '$type'";
      $src = ICDC::MakeModel::Model::Node->new($src, undef, $model);
    }
    if ($model->node($dst)) {
      $dst = $model->node($dst);
    }
    else {
      WARN "No source node '$dst' defined in Nodes for Ends entry in edge type '$type'";
      $dst = ICDC::MakeModel::Model::Node->new($dst, undef, $model);
    }
    push @{$self->{_ends}}, {Src => $src, Dst => $dst};
  }
  return $self;
}
sub tags { @{shift->{_tags}} }
sub name { shift->{_name} }
sub props { values %{shift->{_props}} }
sub prop { $_[0]->{_props}{$_[1]} }
sub ends { @{shift->{_ends}} }
sub multiplicity { shift->{_edgedef}->{Mul} }

1;

package ICDC::MakeModel::Model::Edge;
use Log::Log4perl qw/:easy/;
use Clone qw/clone/;
use strict;

# one edge per type:src:dst triplet
sub new {
  my $class = shift;
  my ($type, $info, $model) = (@_);
  my $self = {
    _name => undef,
    _tags => [],
    _type => undef,
    _edgedef => {},
    _src => undef,
    _dst => undef,
  };
  my ($src,$dst);
  bless $self, $class;
  $self->{_edgedef} = clone($info);

  $self->{_name} = $self->{_type} = $model->edge_type($type);
  if ($info->{Tags}) {
    $self->{_tags} = $info->{Tags};
  }
  unless ($self->{_src} = $src = $info->{Src}) {
    WARN "An edge of type '$type' is missing source node spec";
  }
  unless ($self->{_dst} = $dst = $info->{Dst}) {
    WARN "An edge of type '$type' is missing destination node spec";
  }
  if ($model) {
    unless ($self->{_src} = $model->node($self->{_src})) {
      WARN "No node object defined yet with name '$$self{_src}' for an edge of type '$type'";
    }
    unless ($self->{_dst} = $model->node($self->{_dst})) {
      WARN "No node object defined yet with name '$$self{_dst}' for an edge of type '$type'";
    }
  }
  else {
    WARN "Edge constructor called without model object: src and dst are strings, not Node objects";
  }
  $model->{_edge_table}{$type}{$src}{$dst} = $self;
  return $self;
}

sub tags { @{shift->{_tags}} }
sub type { shift->{_type} }
sub name { shift->{_name} }
sub src { shift->{_src} }
sub dst { shift->{_dst} }
sub props {shift->type->props}
sub prop { shift->type->prop(@_) }
sub multiplicity { $_[0]->{_edgedef}->{Mul} || $_[0]->type->{_edgedef}->{Mul} }
sub is_required { $_[0]->{_edgedef}->{Req} || $_[0]->type->{_edgedef}->{Req} }

1;

package ICDC::MakeModel::Model;

=head1 NAME

ICDC::MakeModel::Model - slurp MDF model into objects

=head1 SYNOPSIS

$model = ICDC::MakeModel::Model->($mm);

=head1 DESCRIPTION



1;

package ICDC::MakeModel;
use lib '../../lib';
use v5.10;
use Log::Log4perl qw/:easy/;
use ICDC::MakeModel::Config;
use ICDC::MakeModel::Schema;
use Tie::IxHash;
use File::Find;
use Hash::Merge;
use strict;
use warnings;

our $VERSION="0.1";
our $MERGER = Hash::Merge->new();
if (defined $OVERLAY_MERGE_BEH) {
  $MERGER->add_behavior_spec($OVERLAY_MERGE_BEH, 'R_OVERLAY');
}
$MERGER->set_behavior('R_OVERLAY');
Log::Log4perl->easy_init({level => $LOG_LEVEL,
			 layout => '%p: %m (%d in %M)%n'});

sub new {
  my $class = shift;
  my %args = @_;
  #use args to override imports from ICDC::MakeModel::Config
  for my $k (keys %args) {
    my ($var) = grep /^.$k$/,@ICDC::MakeModel::Config::EXPORT;
    next unless $var;
    eval "$var = \$args{$k};";
    1;
  }
  Log::Log4perl->easy_init({level => $LOG_LEVEL,
			    layout => '%p: %m (%d in %M)%n'});
  my $self = {
    _node_objs => {}, # will hold ptrs to the schema for each node
    _native_objs => {}, # will hold ptrs to the schema for each native Gen3 yaml
    _input_yaml => undef, # will hold the definition yaml that is input by user
    _key_order => {}, # will hold the order of hash keys as "/add/ress/..." => [qw/order of keys]
    _native_yaml => [], # will hold file names of Gen3 native files that should be slurped as-is
    _nodes_with_relns => {}, # hold names of nodes having incoming and/or outgoing links
   };
  return bless $self, $class;
}

# $nr = $o->get_node(<nodename>);
sub get_node {
  my $self = shift;
  my ($n) = @_;
  die "nodename required as arg 1" unless defined $n;
  my $nr = $self->{_node_objs};
  return $nr->{$n} if $nr->{$n};
  return $nr->{$n}=ICDC::MakeModel::Schema->new(@_); # make a place if not exist (pass args along)
}

sub get_native {
  my $self = shift;
  my ($n) = @_;
  die "native nodename require as arg 1" unless defined $n;
  return $self->{_native_objs}{$n};
}

# $input_root = $o->input;
sub input { shift->{_input_yaml} }
# @nodenames = $o->nodes
sub nodes { $_[0]->{_nodes} && keys %{$_[0]->{_nodes}} }
# @relntypes = $o->relationships
sub relationships { $_[0]->{_relns} && keys %{$_[0]->{_relns}} }
sub ends { ($_[1] && $_[0]->{_relns}{$_[1]} && $_[0]->{_relns}{$_[1]}{Ends}) ? @{$_[0]->{_relns}{$_[1]}{Ends}} : () }
sub props { ($_[1] && $_[0]->{_nodes}{$_[1]} && $_[0]->{_nodes}{$_[1]}{Props}) ? @{$_[0]->{_nodes}{$_[1]}{Props}} : () }
sub natives { $_[0]->{_native_objs} && keys %{$_[0]->{_native_objs} }}

sub node_has_links {
  my $self = shift;
  my ($sch) = @_;
  my $name = ref $sch ? $sch->name : $sch;
  return grep /^$name$/,keys %{$self->{_nodes_with_relns}};
}

# can read multiple input yaml; merge into one hash with Hash::Merge
sub read_input {
  my ($self, @in_pths) = @_;
  $self->{_input_yaml} = {};
  INFO "Input files: ".join(',',@in_pths);
  for my $pth (@in_pths) {
    my $pth_o = YAML::PP::LoadFile($pth);
    my @dels = delete_paths($pth_o);
    $self->{_input_yaml} = $MERGER->merge( $self->{_input_yaml}, $pth_o);
    if (@dels) {
      do_deletes($self->{_input_yaml}, \@dels);
    }
  }
  $self->{_native_yaml} = $self->input->{NativeSchemaIncludes};
  unless ($self->input->{Nodes}) {
    die "No nodes defined";
  }
  unless ($self->input->{Relationships}) {
    die "No relationships defined";
  }
  $self->{_nodes} = $self->input->{Nodes};
  $self->{_relns} = $self->input->{Relationships};
  # record nodes participating in relationships
  for my $r (keys %{$self->{_relns}}) {
    next unless $self->{_relns}{$r}{Ends};
    for my $e (@{$self->{_relns}{$r}{Ends}}) {
      ${$self->{_nodes_with_relns}}{$e->{Src}}++;
      ${$self->{_nodes_with_relns}}{$e->{Dst}}++
    }
  }
  1;
}

sub create_node_schemas {
  my ($self) = @_;
  my @nodes; 
  unless (@nodes = $self->nodes) {
    ERROR "Input defines no Nodes";
    return;
  }
  for my $nodename (@nodes) {
    my @args;
    my $node_input =$self->input->{Nodes}{$nodename};
    if ( $node_input->{Category} ) {
      push @args, ( Category => $node_input->{Category} );
    }
    if ( $node_input->{UniqueKeys} ) {
      push @args, ( UniqueKeys => $node_input->{UniqueKeys} );
    }
    # build schema
    my $node = $self->get_node($nodename,@args);

    # links
    $self->_build_node_links($node);

    # properties and terms
    $self->_build_node_properties($node);

    # finalize
    $node->_finalize_schema;

    unless ($self->node_has_links($node)) {
      WARN "Node '$nodename' has no edges/links";
    }
  }
}

# find native yamls and slurp
# _read_native_yamls('.', '~/place/where/they/are',...)
sub load_native_yamls {
  my $self = shift;
  my @search_dirs = @_;
  my @natives;
  unless (@natives = @{$self->{_native_yaml}}) {
    INFO "Input includes no Gen3-native yaml files";
    return;
  }
  if (@natives && !@search_dirs) {
    WARN "Input includes Gen3-native yaml files, but no dirs to search for these files is provided";
    return;
  }
  for my $yf (@natives) {
    my $s;
    if (! -e $yf && @search_dirs) {
      my $fyf;
      find( { wanted => sub {
		state $found;
	      return if $found;
	      if (-e $yf) {
		$fyf = File::Spec->catfile($File::Find::dir,$yf);
		$found = 1;
	      }}, follow => 1,
	    },@search_dirs );
      if ($fyf) {
	next unless ($s = ICDC::MakeModel::Schema->new_from_native_yaml($fyf));
      }
      else {
	WARN "Native yaml file '$yf' not found. Skipping.";
	next;
      }
    }
    else {
      next unless ($s = ICDC::MakeModel::Schema->new_from_native_yaml($yf));
    }
    $self->{_native_objs}{$s->name} = $s; 
  }
  return 1;
}

sub _build_node_links {
  my $self = shift;
  my ($node) = @_;
  my $relns = $self->_relns_with_src_node($node);
  $node->_add_links($relns);
}

sub _build_node_properties {
  my $self = shift;
  my ($node) = @_;
  my $pdefs = $self->input->{PropDefinitions};
  unless (defined $pdefs) {
    FATAL "PropDefinitions section not present in input";
    die "Input yaml error";
  }
  my $ndef = $self->input->{Nodes}{$node->name};
  unless (defined $ndef) {
    FATAL "Node '".$node->name."' not found in input";
    die "Input yaml error";
  }
  return 1 unless defined $ndef->{Props};
  for my $prop (@{$ndef->{Props}}) {
    next unless defined $prop;
    if ($pdefs->{$prop}) {
      $node->_add_std_property($prop, $pdefs->{$prop});
    }
    else {
      WARN "Property '$prop' of node '".$node->name."' does not appear in PropDefintions";
      $node->_add_std_property($prop);
    }
  }
  for my $prop (@{$ndef->{SystemProps}}) {
    next unless defined $prop;
    if ($pdefs->{$prop}) {
      $node->_add_sys_property($prop, $pdefs->{$prop});
    }
    else {
      WARN "Property '$prop' of node '".$node->name."' does not appear in PropDefintions";
      $node->_add_sys_property($prop);
    }
  }
}


# $o->_relns_with_src_node(<nodename>) returns { <relname> => [ {Src=>...}, {Src=>...},... ] }
sub _relns_with_src_node {
  my ($self, $nodename) = @_;
  die "nodename required as arg 1" unless defined $nodename;
  $nodename = $nodename->name if ref $nodename; # can use object
  my %relns;
  for ($self->relationships) {
    next unless defined $self->{_relns}{$_}{Ends};
    my @ends = grep { $_->{Src} eq $nodename  } @{$self->{_relns}{$_}{Ends}};
    if (@ends) {
      $relns{$_} = [@ends];
    }
  }
  1;
  return \%relns;
}

sub viz {
  my $self = shift;
  my ($outf) = @_;
  unless (eval "require GraphViz2; 1") {
    ERROR "GraphViz2 package not installed; barfing.";
    return;
  }
  my $graph = GraphViz2->new(
    edge => {color => 'black'},
    global => {directed => 1,
	       record_shape => 'Mrecord',},
    node => {shape => 'oval'},
    label_scheme => 3,
   );
  for ($self->nodes) {
    my @lbl = $self->props($_);
    unshift @lbl, $_;
    if (@lbl>1) {
      $lbl[1] = "|{$lbl[1]";
      $lbl[-1] = "$lbl[-1]}|";
    }
    $graph->add_node(name => $_, label => \@lbl);
  }
  for my $r ($self->relationships) {
    for my $ends ($self->ends($r)) {
      $graph->add_edge( from => $ends->{Src}, to => $ends->{Dst}, label=>"$r" );
    }
  }
  if ($outf) {
    $graph->run(driver=>'dot', format=>'svg',output_file=>$outf);
  }
  else {
    $graph->run(format=>'svg');
    print $graph->dot_output;
  }
  return;
}

# search for hash keys or array elements starting with '/'
# return an arrayref of items to delete:
# hash values to delete: [ '{..}...{delete_me}', 'delete_me' ]
# array elements to delete: [ '{...}...[n]', 'delete_me']
sub delete_paths {
  my ($pth_o) = @_;
  my $walk;
  my @dpths;
  $walk = sub {
    my ($adr, $ptr) = @_;
    unless (defined $ptr) {
      return;
    }
    if (ref $ptr eq '' or ref($ptr) =~ /^JSON::PP/) { # scalar
      if ($ptr =~ m|^/(.*)|) { # delete char present on value
	push @dpths, [$adr,$1];
      }
      else {
	1; # done at leaf
      }
    }
    elsif (ref $ptr eq 'HASH') {
      for my $k (keys %{$ptr}){
	if ( $k =~ m|^/(.*)| ) { # delete char present on key
	  push @dpths, [$adr."\{$1\}", $1]; # prune from here
	}
	else {
	  $walk->($adr."\{$k\}", $ptr->{$k});
	}
      }
    }
    elsif (ref $ptr eq 'ARRAY') {
      for my $i (0..$#$ptr) {
	$walk->($adr."\[$i\]",$ptr->[$i]);
      }
    }
    else {
      FATAL "Can't handle ref type ".ref($ptr);
      die "YAML read error";
    }
  };
  $walk->('',$pth_o);
  return @dpths;
}

sub do_deletes {
  my ($y, $dels) = @_;
  for my $d (@$dels) {
    next unless (@$d == 2);
    if ($$d[0] =~ /}$/) {
      if (eval "exists \$y->$$d[0];") {
	eval "delete \$y->$$d[0];";
      }
      else {
	ERROR "Delete of non-existent key requested: '$$d[0]'";
      }
      $$d[0] =~ s|($$d[1])\}$|'/$1'}|;
      eval "delete \$y->$$d[0];";
    }
    elsif ($$d[0] =~ /\]$/) {
      # get address of the array itself
      $$d[0] =~ s/\[[0-9]+\]$//;
      my $ary = eval "\$y->$$d[0]";
      @{$ary} = grep !/^\/?$$d[1]$/,@$ary; # remove element and delete indicator
      1;
    }
    else {
      FATAL "Don't understand delete path '$$d[0]'";
    }
  }
}

sub include {
}

sub place_verbatim {
}

=head1 NAME

ICDC::MakeModel - Create Gen3-style node schemas from a convenient model description

=head1 SYNOPSIS

 $model = ICDC::MakeModel->new;
 $model->read_input("icdc-model.yml","icdc-model-props.yml");
 $model->create_node_schemas;
 for my $nodename ($model->nodes) {
   my $fn = "$nodename.yaml";
   open my $fh, ">", $fn or die $!;
   printf $fh $model->get_node($nodename)->as_yaml;
 }


=head1 DESCRIPTION

C<MokeModel> takes one or two simple description files as input, and
creates the set of node schema YAML files necessarily to drive a Gen3
commons instance.

=head1 METHODS

=over 

=item read_input(@list_of_yaml_files)

Read in input yaml files. The resulting objects are merged, so large
components (like PropDefinitions) can be put in separate files.

=item create_node_schemas()

Build the Schema objects for all nodes defined in the input. 

=item nodes()

Return list of node names.

=item relationships()

Return list of relationship names.

=item get_node($nodename)

Return the L<ICDC::MakeModel::Schema> for the named node.

=item viz([$filename])

Create an SVG file of the model using GraphViz.

=back

=head1 CONFIG VARS

These are present in L<ICDC::MakeModel::Config> and are exported by
that module. They define some boilerplate items that will appear in
all output schema YAMLs.

=over

=item $LOG_LEVEL

Level for log reporting (C<$DEBUG>, C<$INFO>, C<$WARN>, C<$ERROR>, C<$FATAL>).

=item @TOP_LEVEL_KEY_ORDER

Order of the schema file's top-level keys in the output YAML.

=item $GEN3_NS

String value for top-level 'namespace' key. 

=item $MULT_DEFAULT

Default multiplicity (C<many_to_many>, C<one_to_many>, or C<many_to_one>) for links.

=item $STANDARD_SYSTEM_PROPERTIES

System properties that need to be present in every schema (list of property names).
		 
=item $PROP_REQ_DEFAULT

Boolean : should properties be defined as required by default?

=item $PROP_TYPE_DEFAULT

Default type for properties whose type is unspecified in input.

=item $PROP_NULLABLE_DEFAULT

Boolean : should properties be defined as nullable by default?
		 
=item $ADD_TERM_REF_BY_DEFAULT

Boolean : should a 'term' entry be added to all properties by default?

=back

=head1

SEE ALSO

L<ICDC::MakeModel::Config>, L<ICDC::MakeModel::Schema>

=head1 AUTHOR

 Mark A. Jensen (mark -dot- jensen -at- nih -dot- gov)
 FNLCR

=cut

1;

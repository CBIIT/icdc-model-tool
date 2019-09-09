package ICDC::MakeModel;
use lib '../../lib';
use v5.10;
use Log::Log4perl qw/:easy/;
use ICDC::MakeModel::Config;
use ICDC::MakeModel::Model;
use YAML::PP qw/LoadFile/;
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
  return $self->model->node($n);
  # my $nr = $self->{_node_objs};
  # return $nr->{$n} if $nr->{$n};
  # return $nr->{$n}=ICDC::MakeModel::Schema->new(@_); # make a place if not exist (pass args along)
  # return $nr->{$n}=ICDC::MakeModel::Schema->new(@_); # make a place if not exist (pass args along)
}

sub model { shift->{_model} }
# $input_root = $o->input;
sub input { shift->{_input_yaml} }

sub nodes { map { $_->name } shift->model->nodes }
sub relationships { map { $_->name } shift->model->edge_types }
sub ends { map { { Src => $_->{Src}->name, Dst => $_->{Dst}->name } } $_[0]->model->edge_type($_[1])->ends }

sub props { map { $_->name } $_[0]->model->node($_[1])->props }

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
    my $pth_o = LoadFile($pth);
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
  $self->{_model} = ICDC::MakeModel::Model->new($self);
  1;
}

sub table {
  my $self = shift;
  my ($fn) = @_;
  my $fh = \*STDOUT;
  if ($fn) {
    open $fh, ">", $fn or die "Problem opening file '$fn': $!";
  }
  for my $n (sort $self->nodes) {
    for my $p (sort $self->props($n)) {
      say $fh join("\t",$n,$p);
    }
  }
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
    my @lbl = map { $_->name } $self->model->node($_)->props;
    unshift @lbl, $_;
    if (@lbl>1) {
      $lbl[1] = "|{$lbl[1]";
      $lbl[-1] = "$lbl[-1]}|";
    }
    $graph->add_node(name => $_, label => \@lbl);
  }
  for my $r ($self->model->edges) {
    $graph->add_edge( from => $r->src->name, to => $r->dst->name, label=>$r->type );
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

=head1 NAME

ICDC::MakeModel - Perform useful functions on an MDF-defined graph model

=head1 SYNOPSIS

 $model = ICDC::MakeModel->new;
 $model->read_input("icdc-model.yml","icdc-model-props.yml");

=head1 DESCRIPTION

C<MokeModel> takes one or two simple Model Description Files (MDFs) as input,
and converts these into objects that can be computed. Using these, MakeModel
defines some useful functions for visualization and transformation of the model.

=head1 METHODS

=over 

=item read_input(@list_of_yaml_files)

Read in input yaml files. The resulting objects are merged, so large
components (like PropDefinitions) can be put in separate files.

=item nodes()

Return list of node names.

=item relationships()

Return list of relationship names.

=item viz([$filename])

Create an SVG file of the model using GraphViz.

=item table([$filename])

Create a simple tab-delimited table of node and property names in this format:

  node1    prop1
  node1    prop2
  node2    prop3
  node2    prop4
  ...

=back

=head1 CONFIG VARS

These are present in L<ICDC::MakeModel::Config> and are exported by
that module. They define some defaults for certain entity attributes.

=over

=item $LOG_LEVEL

Level for log reporting (C<$DEBUG>, C<$INFO>, C<$WARN>, C<$ERROR>, C<$FATAL>).

=item $MULT_DEFAULT

Default multiplicity (C<many_to_many>, C<one_to_many>, or C<many_to_one>) for edges.

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

L<ICDC::MakeModel::Config>, L<ICDC::MakeModel::Model>

=head1 AUTHOR

 Mark A. Jensen (mark -dot- jensen -at- nih -dot- gov)
 FNLCR

=cut

1;

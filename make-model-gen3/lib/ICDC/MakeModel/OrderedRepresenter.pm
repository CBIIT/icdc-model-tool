package ICDC::MakeModel::OrderedRepresenter;
use base YAML::PP::Representer;

# this representer respects key order of Tie::IxHash hashes

sub dump_node {
  my ($self, $node) = @_;

  my $schema = $self->schema;
  my $representers = $schema->representers;
  my $seen = $self->{seen};
  my $anchor;
  if (ref $node) {

    if ($seen->{ $node } > 1) {
      $anchor = $self->{refs}->{ $node };
      unless (defined $anchor) {
	my $num = ++$self->{anchor_num};
	$self->{refs}->{ $node } = $num;
	$anchor = $num;
      } else {
	$self->emitter->alias_event({ value => $anchor });
	return;
      }

    }
  }
  if (ref $node eq 'HASH') {
    my $style = 'block';
    $self->emitter->mapping_start_event({ anchor => $anchor, style => $style });
    my @keys;
    @keys = ref tied(%$node) eq 'Tie::IxHash' ? keys %$node : sort keys %$node;
    for my $key (@keys) {
      $self->dump_node($key);
      $self->dump_node($node->{ $key });
    }
    $self->emitter->mapping_end_event;
  } elsif (ref $node eq 'ARRAY') {
    my $style = 'block';
    $self->emitter->sequence_start_event({ anchor => $anchor, style => $style });
    for my $elem (@$node) {
      $self->dump_node($elem);
    }
    $self->emitter->sequence_end_event;
  } elsif (ref $node) {
    # TODO check configuration for boolean type
    if (ref $node eq 'JSON::PP::Boolean' or ref $node eq 'boolean') {
      $self->emitter->scalar_event({
	value => $node ? 'true' : 'false',
	style => ':',
	anchor => $anchor,
      });
    } else {
      die "Not implemented";
    }
  } else {
    my $result;
    if (not defined $node) {
      if (my $undef = $representers->{undef}) {
	$result = $undef->($self, $node);
      } else {
	$result = { plain => "" };
      }
    }
    if (not $result and my $flag_rep = $representers->{flags}) {
      for my $rep (@$flag_rep) {
	my $check_flags = $rep->{flags};
	my $flags = B::svref_2object(\$node)->FLAGS;
	if ($flags & $check_flags) {
	  my $res = $rep->{code}->($self, $node);
	  if (not $res->{skip}) {
	    $result = $res;
	    last;
	  }
	}

      }
    }
    if (not $result and my $equals = $representers->{equals}) {
      if (my $rep = $equals->{ $node }) {
	my $res = $rep->{code}->($self, $node);
	if (not $res->{skip}) {
	  $result = $res;
	}
      }
    }
    if (not $result and my $regex = $representers->{regex}) {
      for my $rep (@$regex) {
	if ($node =~ $rep->{regex}) {
	  my $res = $rep->{code}->($self, $node);
	  if (not $res->{skip}) {
	    $result = $res;
	    last;
	  }
	}
      }
    }
    $result ||= { any => $node };
    if (exists $result->{plain}) {
      $self->emitter->scalar_event({ value => $result->{plain}, style => ":" });
    } elsif (exists $result->{quoted}) {
      $self->emitter->scalar_event({ value => $result->{quoted}, style => "'" });
    } elsif (exists $result->{any}) {
      $self->emitter->scalar_event({ value => $result->{any}, style => "" });
    } else {
      die "Unexpected";
    }
  }
}

1;

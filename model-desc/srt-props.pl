#!/usr/bin/env perl
use v5.10;
use JSON::ize;
use strict;

my $y = Y "icdc-model.yml";
my $yp = Y "icdc-model-props.yml";
my $N;
my @nodes=sort keys %{$N=$y->{Nodes}};
my $PD = $yp->{PropDefinitions};

say "PropDefinitions:";
for my $n (@nodes) {
  next unless $N->{$n}{Props};
  my @props = sort @{$N->{$n}{Props}};
  say "# $n props";
  for my $p (@props) {
    my $v = $PD->{$p};
    $v ||= { Desc => '?', Src => '?', Type => 'TBD' };
    my $rndr = Y { $p => $v };
    $rndr =~ s/---\n//; $rndr =~ s/^/  /gm;
    print $rndr; }
}

=head1 NAME

srt-props.pl - Output PropDefinitions YAML, group property definitions by nodes

=head1 SYNOPSIS

  $ cd .../icdc-model-tool/model-desc
  $ ./srt-props.pl > icdc-model-props.srt.yml

=head1 DESCRIPTION

C<srt-props.pl> uses C<icdc-model.yml> and C<icdc-model-props.yml> to
create a grouped and sorted version of C<icdc-model-props.yml>, output
to STDOUT. 

It groups the properties by nodes, and sorts both node groups and the
properties alphabetically.

=cut

# > icdc-model-props.srt.yml

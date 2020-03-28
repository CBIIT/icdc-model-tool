use GraphViz2;
use Neo4j::Bolt;
use List::MoreUtils qw/uniq/;
use v5.10;
use strict;
use warnings;

my $bridg_url = 'bolt://localhost:32795';
my $icdc_map = "bridg-ids.txt";

my $dbh = Neo4j::Bolt->connect($bridg_url);
unless ($dbh->connected) {
  die "No connection to neo4j bridg db.";
}

open my $f, $icdc_map or die "Need icdc-bridg map table, got $!";
$_ = <$f>;
chomp;
my %tbl;
my %color = (
  'uml:Class' => 'red',
  'uml:Association' => 'blue',
  'uml:Property' => 'green'
 );
my %style = (
  'is_a' => 'bold',
  'has_src' => 'dotted',
  'has_dst' => 'dotted',
  'has_property' => 'dashed',
 );
my @hdrs = split /\t/;
while (<$f>) {
  chomp;
  my %dta;
  @dta{@hdrs} = split /\t/;
  push @{$tbl{$dta{bid}}}, [$dta{type}, $dta{icdc}]
}
# nodes with tmp_flag set were marked as mapped to icdc model

my $sth = $dbh->run_query(<<Q);
match p=(a)-[]-(b)-[]-(c) where exists(a.tmp_flag) and
exists(c.tmp_flag) and head(labels(b)) in ['Class','Association','Generalization']
return p
Q

my $graph = GraphViz2->new(
  edge => {color => 'black'},
  global => {directed => 1,
             record_shape => 'Mrecord',},
  node => {shape => 'oval'},
  label_scheme => 3,
 );

my %nodes_done = ('UrClass' => 1 );
my %relns_done;
while (my @r = $sth->fetch_next) {
  my $pth = $r[0];
  next unless $pth;
  $pth = munge_path($pth);
  for my $n (values %{$pth->{nodes}}) {
    next if ($n->{node}{properties}{type} && ($n->{node}{properties}{type} eq 'uml:Property'));
    unless ($nodes_done{$n->{name}}) {
      my @icdc;
      if ($tbl{$n->{node}{properties}{id}}) {
        @icdc = @{$tbl{$n->{node}{properties}{id}}};
      }
      my @lbl;
      if (@icdc) {
        eval {
          @lbl = map { join(':',@$_) } @icdc;
          @lbl = uniq @lbl;
        };
        if ($@) {
          $DB::single=1;
          1;
        }
      }
      unshift @lbl, $n->{name};
      if (@lbl>1) {
        $lbl[1] = "|{$lbl[1]";
        $lbl[-1] = "$lbl[-1]}|";
      }
      $graph->add_node(name => $n->{name},
                       (@lbl ? (label => \@lbl) : ()),
                       color => $color{$n->{node}{properties}{type}},
                      );
      $nodes_done{$n->{name}}++;
    }
  }
  for my $e (values %{$pth->{relns}}) {
    next if $$e{src_name} eq 'UrClass';
    next if $$e{dst_name} eq 'UrClass';
    next if $$e{rel}{type} eq 'has_property';
    my $k = "$$e{src_name}:$$e{dst_name}:$$e{rel}{type}";
    unless ($relns_done{$k}) {
      $graph->add_edge( from => $e->{src_name}, to => $e->{dst_name},
                        label => $e->{rel}{type},
                        style => $style{$e->{rel}{type}} // 'solid'
                       );
      $relns_done{$k}++;
    }
  }
  
  1;
}

$graph->run(driver=>'dot', format=>'svg',output_file=>"bridg-viz-no-props.svg");


sub munge_path {
  my ($pth) = @_;
  my (%nodes, %relns);
  for my $e (sort { ref($a) cmp ref($b) } @$pth) {
    for (ref $e) {
      /Node/ && do {
        unless ($nodes{$e->{id}}) {
          $nodes{$e->{id}}{name} = $e->{properties}{name};
          $nodes{$e->{id}}{node} = $e;
        }
        next;
      };
      /Relation/ && do {
        $relns{$e->{id}} = {
          rel => $e,
          src_name => $nodes{$e->{start}} && $nodes{$e->{start}}{name},
          dst_name => $nodes{$e->{end}} && $nodes{$e->{end}}{name},
         };
        next;
      };
      do {
        die "What?"
      };
    }
  }
  return { nodes => \%nodes, relns => \%relns };
}
__DATA__
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
    $graph->add_edge( from => $r->src->name, to => $r->dst->name, label=>$r->type->name );
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

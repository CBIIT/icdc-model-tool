use Test::More;
use Bento::MakeModel;
use strict;

my @org_files = qw/icdc-model.yml icdc-model-props.master.yml/;
my @yeti_files = qw/icdc-model.yml icdc-model-props.yeti.yml/;

my $org_m = Bento::MakeModel->new->read_input(@org_files)->model;
my $yeti_m = Bento::MakeModel->new->read_input(@yeti_files)->model;

for my $item (qw/nodes props edge_types/) {
  diag($item);
  is_deeply( [sort map {$_->name} $org_m->$item], [sort map {$_->name} $yeti_m->$item]);
}

for my $org_prop ($org_m->props) {
  diag "property: ".$org_prop->name;
  my $yeti_prop = $yeti_m->prop($org_prop->name);
  my $org_pd = $org_prop->{_propdef};
  my $yeti_pd = $yeti_prop->{_propdef};
  is_deeply( [ sort keys %$org_pd ],[ sort keys %$yeti_pd ],"propdef keys") ;
  if (my $odesc = $org_pd->{Desc}) {
    my $ydesc;
    ok ($ydesc = $yeti_pd->{Desc},"Desc present in yeti");
    $odesc = s/\s+/ /gs;
    $ydesc = s/\s+/ /gs;
    is ($odesc,$ydesc, "Desc content same");

  }
}

done_testing;

1;

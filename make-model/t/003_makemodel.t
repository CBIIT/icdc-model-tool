use Test::More;
use Test::Exception;
use File::Spec;
use lib '../lib';
use Log::Log4perl::Level;
use ICDC::MakeModel;
my $samplesd = File::Spec->catdir( (-d 't' ? 't' : '.'), 'samples' );
my (@n, @r);

$obj = ICDC::MakeModel->new(LOG_LEVEL=>$FATAL);
$obj->read_input( File::Spec->catdir($samplesd,"icdc-model.yml"), File::Spec->catdir($samplesd,"icdc-model-props.yml") );
lives_ok {@n = $obj->nodes} "nodes";
lives_ok {@r = $obj->relationships} "relationships";

for ($obj->nodes) {
  lives_ok {$obj->props($_)} "props for $_";
}

ok $obj->load_native_yamls($samplesd);
ok $obj->get_native('_definitions'),'_definitions.yaml';
ok $obj->get_native('_terms'),'_terms.yaml';

ok my $rels_of_sample = $obj->_relns_with_src_node("sample");
is_deeply [sort keys %$rels_of_sample], [sort qw/on_visit next/], "relns of sample";

$obj->create_node_schemas;
is_deeply [ sort keys %{$obj->get_node('visit')->root} ], [sort @ICDC::MakeModel::TOP_LEVEL_KEY_ORDER], "'visit' has all top-level keys";
is_deeply [ sort keys %{$obj->get_node('prior_surgery')->root} ], [sort @ICDC::MakeModel::TOP_LEVEL_KEY_ORDER], "'prior_surgery' has all top level keys";

$DB::single=1;
my $ystr = $obj->get_node('visit')->as_yaml;
my @tlo = grep /^\S*:/, split /\n/,$ystr;
$_=~s/^(\S*):.*/$1/ for @tlo;

is_deeply \@tlo, \@ICDC::MakeModel::TOP_LEVEL_KEY_ORDER, "yaml top-level key order correct";

is $obj->get_node('file')->root->{category}, 'data_file', "set category for 'file' node correct";
is $obj->get_node('case')->root->{category}, 'administrative', "set category for 'case' node correct";

ok $obj->{_nodes_with_relns}{program}, 'program has links';
ok $obj->node_has_links($obj->get_node('file')), 'file has links';
done_testing;

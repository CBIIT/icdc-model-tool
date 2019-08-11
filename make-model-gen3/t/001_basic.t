use Test::More;
use Test::Exception;
use Log::Log4perl::Level;
use File::Spec;
use lib '../lib';
my $samplesd = File::Spec->catdir( (-d 't' ? 't' : '.'), 'samples' );
my $obj;
use_ok("ICDC::MakeModel");
use_ok("ICDC::MakeModel::Schema");
use_ok("ICDC::MakeModel::Config");
isa_ok( $obj = ICDC::MakeModel->new(), "ICDC::MakeModel");
lives_ok { $obj->read_input( File::Spec->catdir($samplesd,"try.yml") ) } "read yaml";
is_deeply [sort $obj->nodes], [qw/boog goob/], "nodes";
is_deeply [sort $obj->relationships], [qw/goob_of/], "relationships";

undef $obj;
$obj = ICDC::MakeModel->new(LOG_LEVEL=>$FATAL);
$obj->read_input( File::Spec->catdir($samplesd,"icdc-model.yml"), File::Spec->catdir($samplesd,"icdc-model-props.yml") );
lives_ok {@n = $obj->nodes} "nodes";
lives_ok {@r = $obj->relationships} "relationships";

ok my $rels_of_sample = $obj->_relns_with_src_node("sample");
is_deeply [sort keys %$rels_of_sample], [sort qw/on_visit next/], "relns of sample";

$obj->create_node_schemas;
is_deeply [ sort keys %{$obj->get_node('visit')->root} ], [sort @ICDC::MakeModel::TOP_LEVEL_KEY_ORDER], "'visit' has all top-level keys";
is_deeply [ sort keys %{$obj->get_node('prior_surgery')->root} ], [sort @ICDC::MakeModel::TOP_LEVEL_KEY_ORDER], "'prior_surgery' has all top level keys";

# my $y = $obj->get_node('visit')->as_yaml;

done_testing;

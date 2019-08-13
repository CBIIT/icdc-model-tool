use Test::More;
use Test::Exception;
use Try::Tiny;
use File::Spec;
use lib '../lib';
use Log::Log4perl::Level;
use ICDC::MakeModel;
my $samplesd = File::Spec->catdir( (-d 't' ? 't' : '.'), 'samples' );
my (@n, @r);

my $NUMNODES=29;
my $NUMNUTS=0;
my $NUMEDGES=36;
my $NUMPROPS=186;
my $NUMETYPES=15;

$obj = ICDC::MakeModel->new(LOG_LEVEL=>$FATAL);
$obj->read_input( File::Spec->catdir($samplesd,"icdc-model.yml"), File::Spec->catdir($samplesd,"icdc-model-props.yml") );

ok $model = ICDC::MakeModel::Model->new($obj);
isa_ok ($model, 'ICDC::MakeModel::Model');

is scalar ($model->nodes), $NUMNODES, "count nodes";
is scalar ($model->props), $NUMPROPS, "count all props";
is scalar ($model->edge_types), $NUMETYPES, "count all edge types";
is scalar ($model->edges), $NUMEDGES, "count all edges";
if (0) {
my $ct=0;
for my $n ($model->nodes) {
  next unless $n;
  diag $n->name;
  $ct++;
  isa_ok ($n, "ICDC::MakeModel::Model::Node");
  ok $n->name, "node has name";
  is $n, $model->node($n->name), "node is indexed";
  for my $p ($n->props) {
    diag join('.',$n->name,$p->name);
    isa_ok ($p, "ICDC::MakeModel::Model::Property");
    ok $p->name, "prop has name";
    is $p, $n->prop($p->name), "prop is indexed";
  }
}
is $ct, $NUMNODES, "all nodes processed";

for my $e ($model->edges) {
  isa_ok($e, "ICDC::MakeModel::Model::Edge");
  ok $e->type, "edge has type";
  for my $p ($e->props) {
    isa_ok ($p, "ICDC::MakeModel::Model::Property");
    is $p, $e->prop($p->name), "prop is indexed";
  }
}
# tag at_type_level : went_off_study
# tag at_ends_level : next/prior_surgery
# tag at_node : lab_exam
# tag at_property : document_number
}
is (($model->node('lab_exam')->tags)[0], 'at_node', "node tag");
is (($model->edge_type('went_off_study')->tags)[0], 'at_type_level', "edge type tag");
is (($model->prop('document_number')->tags)[0], 'at_property', "property tag");
my ($e) = grep { $_->src->name eq 'prior_surgery' } $model->edges_by_type('next');
ok $e, "found edge";
is (($e->tags)[0], 'at_ends_level', "edge tag");
$DB::single=1;
is_deeply [$model->prop('sex')->values], [qw/M F/], 'prop value array';
ok $model->prop('patient_age_at_enrollment'), "property is required";
ok !$model->prop('sex')->is_required, "property is not required";
is $model->edge_type('of_case')->multiplicity, 'many_to_one', "edge_type mul";
is $model->edge('of_case','diagnosis','case')->multiplicity, 'many_to_one', "edge mul default to edge_type mul";
is $model->edge('of_case', 'enrollment', 'case')->multiplicity, 'one_to_one', "edge mul set locally";
is $model->edge($model->edge_type('of_case'), $model->node('enrollment'), $model->node('case'))->multiplicity, 'one_to_one', "check objects as args to edge()";


done_testing;


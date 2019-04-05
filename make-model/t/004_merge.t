use Test::More;
use Test::Exception;
use File::Spec;
use Set::Scalar;
use lib '../lib';
use Log::Log4perl::Level;
use ICDC::MakeModel;
my $samplesd = File::Spec->catdir( (-d 't' ? 't' : '.'), 'samples' );
my (@n, @r);

$obj = ICDC::MakeModel->new(LOG_LEVEL=>$FATAL);
$obj->read_input( File::Spec->catdir($samplesd,"icdc-model.yml"),
		  File::Spec->catdir($samplesd,"icdc-model-props.yml") );
$obj->create_node_schemas;
diag "check original (before overlay)";
ok( !grep(/^experiment$/, $obj->nodes), "experiment DNE");
ok( grep(/^file$/, $obj->nodes), "file exists...");
is $obj->get_node(file)->root->{category}, 'data_file', "...has data_file category...";
$exp = Set::Scalar->new(qw/project_id object_id file_name file_size data_category
			   data_format data_type/);
$got = Set::Scalar->new(keys %{$obj->get_node('file')->root->{properties}});
ok $got->is_disjoint($exp), "but no gen3 properties";
ok( !grep(/^project_id$/,@{$obj->get_node('case')->root->{systemProperties}}), "case: no 'project_id' in system properties");
ok( !grep(/^dbgap_accession_number$/,keys %{$obj->get_node('program')->root->{properties}}), "program: no 'dbgap_accession_number' in properties");

diag "check overlay...";
$obj = ICDC::MakeModel->new(LOG_LEVEL=>$FATAL);
$obj->read_input( File::Spec->catdir($samplesd,"icdc-model.yml"),
		  File::Spec->catdir($samplesd,"icdc-model-props.yml"),
		  File::Spec->catdir($samplesd,"gen3-model-overlay.yml"),
		 );
$obj->create_node_schemas;
# check merge is correct - following data appear in overlay but not basic model
ok grep(/^experiment$/, $obj->nodes), "experiment DNE";
is $obj->get_node('image')->root->{category}, 'data_file', "set category for 'image' node correct";
ok((@a = grep { $_->{Dst} eq 'experiment' } $obj->ends('member_of')), "experiment <-member_of-... exists");
ok( (grep { $_->{Src} eq 'study_arm' } ($obj->ends('member_of'))), "experiment <-member_of-case exists");
$got = Set::Scalar->new(keys %{$obj->get_node('file')->root->{properties}});
ok $exp->is_subset($got), "file now has all properties";
ok( grep(/^project_id$/,@{$obj->get_node('case')->root->{systemProperties}}), "case: 'project_id' now in system properties");
ok( grep(/^dbgap_accession_number$/,keys %{$obj->get_node('program')->root->{properties}}), "program: 'dbgap_accession_number' now in properties");
done_testing;

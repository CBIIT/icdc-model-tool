use Test::More;
use Test::Exception;
use File::Spec;
use List::MoreUtils qw/any none/;
use lib '../lib';
use ICDC::MakeModel;
use ICDC::MakeModel::Config;
use Log::Log4perl::Level;
use strict;
my $samplesd = File::Spec->catdir( (-d 't' ? 't' : '.'), 'samples' );

$ICDC::MakeModel::LOG_LEVEL = $FATAL;
ok my $s = ICDC::MakeModel::Schema->new_from_native_yaml(File::Spec->catfile($samplesd,"_definitions.yaml"));
isa_ok($s, 'ICDC::MakeModel::Schema');
is $s->name, '_definitions';
							   
ok my $n = ICDC::MakeModel::Schema->new('test');
isa_ok($n, 'ICDC::MakeModel::Schema');

is_deeply [sort keys %{$n->root}],
  [sort qw/$schema id title type namespace category program project description properties additionalProperties submittable uniqueKeys validators systemProperties/], "header keys complete";
is_deeply $n->root->{properties}{type}{enum}, ['test'], "node type : singleton enum";
is_deeply $n->root->{systemProperties}, $STANDARD_SYSTEM_PROPERTIES;

is_deeply [sort keys %{$n->root->{properties}}], [sort (qw/type submitter_id/,@$STANDARD_SYSTEM_PROPERTIES)], "standard properties complete";

$n->_add_std_property( 'prop1', { Enum => [qw/foo bar baz/] } );
ok $n->root->{properties}{prop1}, "made property";
is_deeply $n->root->{properties}{prop1}{enum}, [qw/foo bar baz/], "prop1: enum type";
if ($ADD_TERM_REF_BY_DEFAULT) {
  ok $n->root->{properties}{prop1}{term}, "prop1: term present";
  is_deeply $n->root->{properties}{prop1}{term}, {'$ref' => '_terms.yaml#/prop1'}, "prop1: term entry correct";
} else {
  ok !$n->root->{properties}{prop1}{term}, "prop1: term absent";
}

$n->_add_std_property( 'prop2', { Enum => [qw/foo bar baz/], Type => 'string' } );
is_deeply $n->root->{properties}{prop2}{enum}, [qw/foo bar baz/], "prop2: enum type";
ok !$n->root->{properties}{prop2}{type}, "prop2: no type entry (enum overrides)";

$n->_add_std_property( 'prop3', { Type => 'string', Nul => 1, Req => 1 });
is_deeply $n->root->{properties}{prop3}{type}, ['string', 'null'], "prop3: string type, nullable";

$n->_add_std_property( 'prop4', { Type => 'number', Nul => 0, Req => 1, Term => 'thing' });
is $n->root->{properties}{prop4}{type}, 'number', "prop4: number type not nullable";
is_deeply $n->root->{properties}{prop4}{term}, {'$ref' => "_terms.yaml#/thing"}, "prop4: term entry correct";
ok( !grep(/^prop5_sys$/, @{$n->root->{systemProperties}}), "prop5 not in systemProperties");
$n->_add_sys_property( 'prop5_sys', { Type => 'number', Nul => 0, Req => 1, Term => 'thong' });
is $n->root->{properties}{prop5_sys}{type}, 'number', "prop5_sys: number type not nullable";
is_deeply $n->root->{properties}{prop5_sys}{term}, {'$ref' => "_terms.yaml#/thong"}, "prop5_sys: term entry correct";
ok( grep(/^prop5_sys$/, @{$n->root->{systemProperties}}), "prop5 is now in systemProperties");
$n->_add_links( { has_foo => [ { Src => 'test', Dst => 'foo_opt', Mul => 'many_to_one'},
			       { Src => 'test', Dst => 'foo_req', Mul => 'one_to_many', Req => 1} ] } );
my $l = any { /foo_opts/ } map {$_->{name}} @{$n->root->{links}};
ok $l, "have foo_opts";
$l = any { /foo_reqs/ } map {$_->{name}} @{$n->root->{links}};
ok $l, "have foo_reqs";

$n->_finalize_schema;
$l = any {/prop3/} @{$n->root->{required}} and any {/prop4/} @{$n->root->{required}};
ok $l, "prop3 and prop4 required";
$l = none {/prop2/} @{$n->root->{required}};
ok $l, "prop2 not required";

ok $n->root->{properties}{foo_opts}, 'foo_opt link as property';
ok $n->root->{properties}{foo_reqs}, 'foo_req link as property';
is_deeply $n->root->{properties}{foo_opts}, {'$ref' => '_definitions.yaml#/to_one'}, 'foo_opts defn correct';
is_deeply $n->root->{properties}{foo_reqs}, {'$ref' => '_definitions.yaml#/to_many'}, 'foo_reqs defn correct';
$l = any {/foo_reqs/} @{$n->root->{required}};
ok $l, "foo_reqs link is required";
$l = none {/foo_opts/} @{$n->root->{required}};
ok $l, "foo_opts link is not required";
ok $n->root->{category};
is $n->root->{category}, $DEFAULT_NODE_CATEGORY;


ok $n = ICDC::MakeModel::Schema->new('test', Category => 'data_file');
$n->_finalize_schema;
is $n->root->{category}, 'data_file';
is_deeply $n->root->{uniqueKeys}, [ ['id'] ], 'unique keys default';

ok $n = ICDC::MakeModel::Schema->new('test', Category => 'data_file',
				    UniqueKeys => [ [qw/project_id submitter_id/] ]);
$n->_finalize_schema;
is $n->root->{category}, 'data_file';
is_deeply $n->root->{uniqueKeys}, [ ['id'], [qw/project_id submitter_id/] ], 'unique keys default';



done_testing;

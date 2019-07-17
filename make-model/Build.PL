use Module::Build;
my $build = Module::Build->new(
  dist_name => "ICDC-MakeModel",
  dist_abstract => "Read a config and squirt out Gen3 YAML files",
  dist_version_from => 'lib/ICDC/MakeModel.pm',
  dist_author => 'Mark A. Jensen',
  perl => '5.010',
  configure_requires => {
    'Module::Build' => 0,
   },
  build_requires => {
    'Set::Scalar' => 0,
    'List::MoreUtils' => 0,
    'IPC::Run' => 0,
    'Test::Exception' => 0,
    'Log::Log4perl::Level' => 0,
    'Tie::IxHash' => 0, 
    'JSON' => 0,
   },
  requires => {
    'JSON' => 0,
    'JSON::PP' => 0,
    'Log::Log4perl' => 0,
    'YAML::PP' => '0.018', # plain YAML doesn't do 'null' correctly
    'Tie::IxHash' => 0,
    'Lingua::EN::Inflexion' => 0,
    'Try::Tiny' => 0,
    'Clone' => 0,
    'Hash::Merge' => '0.300',
  },
  recommends => {
    'GraphViz2' => 0,
  }
 );
$build->create_build_script;

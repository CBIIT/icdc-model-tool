use Test::More;
use Test::Exception;
use lib '../lib';
use File::Spec;
use Try::Tiny;
use JSON;
use IPC::Run qw/run/;

my $dir = (-d 't' ? '.' : '..');
my @testoutf = qw/try.svg try.json/;
my $sampdir = File::Spec->catdir($dir, qw/t samples/);
my $tool = File::Spec->catfile($dir, 'bin', 'model-tool');

ok( (-x $tool), "Found model-tool");

my @cmd = ($tool);
my @descfiles = map { File::Spec->catfile($sampdir,$_) } qw/icdc-model.yml icdc-model-props.yml/;
my ($in, $out, $err);

lives_ok { run(\@cmd, \$in, \$out, \$err) } "It runs";
like ($err, qr/FATAL: Nothing to do!/, "Emit 'Nothing to do'");
like ($err, qr/Usage:.*model-tool.*--dry-run/s, "Emit usage hints");



try {
  unlink map {File::Spec->catfile($dir, $_)} @testoutf;
} catch {
  1;
};

$in = $out = $err = '';

lives_ok { run( [$tool, '-g', '-v', File::Spec->catfile($dir,'try.svg'), @descfiles],
		\$in, \$out,\$err) } "-g -v [file] (bad option order)" ;
like ($err, qr/FATAL.*requires an arg/s, "Got correct error");

$in = $out = $err = '';

lives_ok { run( [$tool, '-g', File::Spec->catfile($dir,'try.svg'),'-s','-v', @descfiles],
		\$in, \$out,\$err) } "-g [file] -s -v (bad option order)" ;
like ($err, qr/FATAL.*requires an arg/s, "Got correct error");

$in = $out = $err = '';
lives_ok { run( [$tool, '-g', File::Spec->catfile($dir,'try.svg'), @descfiles],
		\$in, \$out, \$err ) } "-g";
diag $err if $err;
ok(( -e File::Spec->catfile($dir,'try.svg')), "svg created");

$in = $out = $err = '';
lives_ok { run( [$tool, '-j', File::Spec->catfile($dir,'try.json'), @descfiles, '-d',
		File::Spec->catdir($dir,'schema')],
		\$in, \$out, \$err ) } "-j";
diag $err if $err;
ok(( -e File::Spec->catfile($dir,'try.json')), "json created");
diag $err if $err;
open my $j, File::Spec->catfile($dir,'try.json') or die "Can't open try.json: $!";
{
  local $/;
  my $str = <$j>;
  lives_ok { $j = decode_json $str } "smells like json";
  ok grep( /^_definitions.yaml$/, keys %$j), "_definitions.yaml present";
}

1;

done_testing;

END {
  try {
  unlink map {File::Spec->catfile($dir, $_)} @testoutf;
} catch {
  1;
};
}

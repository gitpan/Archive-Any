
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601"
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Single interface to deal with file archives.",
  "dist_author" => [
    "Clint Moore",
    "Michael G Schwern (author emeritus)",
    "Olaf Alders (current maintainer)"
  ],
  "dist_name" => "Archive-Any",
  "dist_version" => "0.0941",
  "license" => "perl",
  "module_name" => "Archive::Any",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Archive::Tar" => 0,
    "Archive::Zip" => 0,
    "Cwd" => 0,
    "File::MMagic" => 0,
    "File::Spec::Functions" => 0,
    "MIME::Types" => 0,
    "Module::Find" => 0,
    "base" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => [],
  "test_requires" => {
    "Test::More" => 0,
    "Test::Warn" => 0
  }
);


unless ( eval { Module::Build->VERSION(0.4004) } ) {
  my $tr = delete $module_build_args{test_requires};
  my $br = $module_build_args{build_requires};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

my $build = Module::Build->new(%module_build_args);

$build->create_build_script;

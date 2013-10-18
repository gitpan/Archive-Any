package Archive::Any::Zip;

use strict;
use vars qw($VERSION @ISA);
$VERSION = 0.03;

require Archive::Any;
@ISA = qw(Archive::Any);


use Archive::Zip qw(:ERROR_CODES);
use Cwd;



sub new {
    my($class, $file) = @_;

    my $self = bless {}, $class;

    Archive::Zip::setErrorHandler(sub {});
    $self->{handler} = Archive::Zip->new($file);
    return unless $self->{handler};

    $self->{file}    = $file;

    return $self;
}


sub files {
    my($self) = shift;

    $self->{handler}->memberNames;
}


sub extract {
    my($self, $dir) = @_;

    my $orig_dir;
    if( $dir ) {
        $orig_dir = getcwd;
        chdir $dir;
    }

    $self->{handler}->extractTree;

    if( $dir) {
        chdir $orig_dir;
    }

    return 1;
}


sub type {
    return 'zip';
}



1;

__END__

=pod

=head1 NAME

Archive::Any::Zip

=head1 VERSION

version 0.0940

=head1 SYNOPSIS

B<DO NOT USE THIS MODULE DIRECTLY>

Use Archive::Any instead.

=head1 DESCRIPTION

Wrapper around Archive::Zip for Archive::Any.

=head1 NAME

Archive::Any::Zip - Archive::Any wrapper around Archive::Zip

=head1 AUTHOR

Michael G Schwern E<lt>schwern@pobox.comE<gt>

=head1 SEE ALSO

Archive::Any, Archive::Zip

=head1 AUTHORS

=over 4

=item *

Clint Moore

=item *

Michael G Schwern (author emeritus)

=item *

Olaf Alders (current maintainer)

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Olaf Alders.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

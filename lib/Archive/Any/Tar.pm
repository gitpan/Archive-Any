package Archive::Any::Tar;
{
  $Archive::Any::Tar::VERSION = '0.0941';
}

use strict;

require Archive::Any;
@ISA = qw(Archive::Any);

use Archive::Tar;
use Cwd;

sub new {
    my ( $class, $file ) = @_;

    my $self = bless {}, $class;

    $self->{handler} = Archive::Tar->new( $file );
    return unless $self->{handler};

    $self->{file} = $file;

    return $self;
}

sub files {
    my ( $self ) = shift;

    $self->{handler}->list_files;
}

sub extract {
    my ( $self, $dir ) = @_;

    my $orig_dir;
    if ( $dir ) {
        $orig_dir = getcwd;
        chdir $dir;
    }

    my $success = $self->{handler}->extract;

    if ( $dir ) {
        chdir $orig_dir;
    }

    return $success;
}

sub type {
    return 'tar';
}

1;

# ABSTRACT: Archive::Any wrapper around Archive::Tar

__END__

=pod

=head1 NAME

Archive::Any::Tar - Archive::Any wrapper around Archive::Tar

=head1 VERSION

version 0.0941

=head1 SYNOPSIS

B<DO NOT USE THIS MODULE DIRECTLY>

Use L<Archive::Any> instead.

=head1 DESCRIPTION

Wrapper around L<Archive::Tar> for L<Archive::Any>.

=head1 SEE ALSO

L<Archive::Any>, L<Archive::Tar>

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

package Archive::Any::Plugin::Tar;
{
  $Archive::Any::Plugin::Tar::VERSION = '0.0940';
}
use strict;
use base 'Archive::Any::Plugin';

use Archive::Tar;
use Cwd;


sub can_handle {
    return(
           'application/x-tar',
           'application/x-gtar',
           'application/x-gzip',
           'application/x-bzip2',
          );
}

sub files {
    my( $self, $file ) = @_;
    my $t = Archive::Tar->new( $file );
    return $t->list_files;
}

sub extract {
    my ( $self, $file ) = @_;

    my $t = Archive::Tar->new( $file );
    return $t->extract;
}

sub type {
    my $self = shift;
    return 'tar';
}


1;

__END__

=pod

=head1 NAME

Archive::Any::Plugin::Tar

=head1 VERSION

version 0.0940

=head1 SYNOPSIS

Do not use this module directly.  Instead, use Archive::Any.

=head1 NAME

Archive::Any::Plugin::Tar - Archive::Any wrapper around Archive::Tar

=head1 SEE ALSO

Archive::Any, Archive::Tar

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

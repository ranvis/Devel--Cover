# Copyright 2004-2006, Paul Johnson (pjcj@cpan.org)

# This software is free.  It is licensed under the same terms as Perl itself.

# The latest version of this software should be available from my homepage:
# http://www.pjcj.net

package Devel::Cover::Subroutine;

use strict;
use warnings;

our $VERSION = "0.55";

use base "Devel::Cover::Criterion";

sub uncoverable { $_[0][2] }
sub covered     { $_[0][0] }
sub total       { 1 }
sub percentage  { $_[0][0] ? 100 : 0 }
sub error       { $_[0][0] xor !$_[0][2] }
sub name        { $_[0][1] }
sub criterion   { 'subroutine' }

sub calculate_summary
{
    my $self = shift;
    my ($db, $file) = @_;

    my $s = $db->{summary};

    $self->aggregate($s, $file, 'total', $self->total);
    $self->aggregate($s, $file, 'uncoverable', 1)
        if $self->uncoverable;
    $self->aggregate($s, $file, 'covered', 1)
        if $self->covered;
    $self->aggregate($s, $file, 'error', 1)
        if $self->error;
}

1

__END__

=head1 NAME

Devel::Cover::Statement - Code coverage metrics for Perl

=head1 SYNOPSIS

 use Devel::Cover::Statement;

=head1 DESCRIPTION

Module for storing subroutine coverage information.

=head1 SEE ALSO

 Devel::Cover::Criterion

=head1 METHODS

=head1 BUGS

Huh?

=head1 VERSION

Version 0.55 - 22nd September 2005

=head1 LICENCE

Copyright 2004-2006, Paul Johnson (pjcj@cpan.org)

This software is free.  It is licensed under the same terms as Perl itself.

The latest version of this software should be available from my homepage:
http://www.pjcj.net

=cut

package Posy::Plugin::Meta::Links;

#
# $Id: Links.pm,v 1.2 2005/03/04 03:10:17 blair Exp $
#

use 5.008001;
use strict;
use warnings;

=head1 NAME

Posy::Plugin::Meta::Links - Append links contained within metadata.

=head1 VERSION

This document describes Posy::Plugin::Meta::Links version B<0.1>.

=cut

our $VERSION = '0.1';

=head1 SYNOPSIS

  @plugins = qw(
    Posy::Core
    ...
    Posy::Plugin::Meta
    Posy::Plugin::Meta::Links
  );
  @entry_actions = qw(header
    ...
    parse_entry
    parse_meta
    meta_links
    render_entry
    ...
  );

=head1 DESCRIPTION

This module appends links to the end of an entry for all links
contained with the entry's metadata.

=head1 INTERFACE

=head2 meta_links()

  $self->meta_links($flow_state, $current_entry, $entry_state)

Alters $current_entry->{body} by appending links for all links found
within C<$current_entry->{meta}{links}>.

=cut
sub meta_links {
  my ($self, $flow_state, $current_entry, $entry_state) = @_;
  if ($current_entry->{meta} and $current_entry->{meta}{links}) {
    my @links = split /\s+/, $current_entry->{meta}{links};
    if (@links) {
      $current_entry->{body} .= "<p>";
      for (@links) {
        $current_entry->{body} .= '<a href="' . $_ .'">[LINK]</a> ';
      }
      $current_entry->{body} .= "</p>";
    }
  }
  1;
} # meta_links()

=head1 SEE ALSO

L<Perl>, L<Posy>, L<Posy::Plugin::Meta>

=head1 AUTHOR

blair christensen., E<lt>blair@devclue.comE<gt>

<http://devclue.com/blog/code/posy/Posy::Plugin::Meta::Links/>

=head1 COPYRIGHT AND LICENSE

Copyright 2005 by blair christensen.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=head1 DISCLAIMER OF WARRANTY                                                                                               

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO
WARRANTY FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE
LAW. EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS
AND/OR OTHER PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY
OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE
OF THE SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE,
YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA
BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES
OR A FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY
OF SUCH DAMAGES.

=cut

1;


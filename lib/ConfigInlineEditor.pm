# -*- Mode: perl; indent-tabs-mode: nil -*-
#
# The contents of this file are subject to the Mozilla Public
# License Version 1.1 (the "License"); you may not use this file
# except in compliance with the License. You may obtain a copy of
# the License at http://www.mozilla.org/MPL/
#
# Software distributed under the License is distributed on an "AS
# IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
# implied. See the License for the specific language governing
# rights and limitations under the License.
#
# The Original Code is the Inline Editor Bugzilla Extension.
#
# The Initial Developer of the Original Code is "Nokia Corporation".
# Portions created by the Initial Developer are Copyright (C) 2011 the
# Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Visa Korhonen <visa.korhonen@symbio.com>

package Bugzilla::Extension::InlineEditor::ConfigInlineEditor;
use strict;
use warnings;

use Bugzilla::Config::Common;

sub get_param_list {
    my ($class) = @_;

    my @param_list = (
                      {
                        name    => 'inline_editor_bug_list_editable_fields',
                        desc    => 'Those fields in bug, that are editable in bug list directly',
                        type    => 'm',
                        choices => [ 'bug_severity', 'priority', 'assigned_to', 'estimated_time', 'remaining_time' ],
                        default => ['estimated_time']
                      },
                      {
                        name    => 'inlineeditor_access_groups',
                        desc    => 'Groups that are allowed to use InlineEditor.',
                        type    => 'm',
                        choices => \&_get_all_group_names,
                        default => ['admin'],
                      },
                     );
    return @param_list;
}

sub _get_all_group_names {
    my @group_names = map { $_->name } Bugzilla::Group->get_all;
    unshift(@group_names, '');

    my @sorted = sort { lc $a cmp lc $b } @group_names;

    return \@sorted;
}

1;

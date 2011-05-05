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
# The Initial Developer of the Original Code is "Nokia Corporation"
# Portions created by the Initial Developer are Copyright (C) 2011 the
# Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Visa Korhonen <visa.korhonen@symbio.com>

package Bugzilla::Extension::EditFieldsInline;

use strict;
use base qw(Bugzilla::Extension);

use Bugzilla::Extension::EditFieldsInline::Bugrpclib;

our $VERSION = '1.0';

sub page_before_template {
    my ($self, $args) = @_;

    my ($vars, $page) = @$args{qw(vars page_id)};

    if ($page eq "editfieldsinline/ajax.html") {
        my $cgi    = Bugzilla->cgi;
        my $schema = $cgi->param('schema');
        if ($schema eq "bug") {
            #            my $msg = update_bug_fields_from_json($vars);
            #            $vars->{errors} = $msg;
            update_bug_fields_from_json($vars);
        }
    }
}

sub config {
    my ($self, $args) = @_;

    my $config = $args->{config};
    $config->{Editfieldsinline} = "Bugzilla::Extension::EditFieldsInline::ConfigEditfieldsinline";
}

sub config_add_panels {
    my ($self, $args) = @_;

    my $modules = $args->{panel_modules};
    $modules->{Editfieldsinline} = "Bugzilla::Extension::EditFieldsInline::ConfigEditfieldsinline";
}

# This must be the last line of your extension.
__PACKAGE__->NAME;

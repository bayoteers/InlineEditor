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
# The Original Code is the Scrums Bugzilla Extension.
#
# The Initial Developer of the Original Code is "Nokia corporation"
# Portions created by the Initial Developer are Copyright (C) 2011 the
# Initial Developer. All Rights Reserved.
#
# Contributor(s):
#   Visa Korhonen <visa.korhonen@symbio.com>

package Bugzilla::Extension::EditFieldsInline;

use strict;
use base qw(Bugzilla::Extension);

#use Bugzilla::Constants;
#use Bugzilla::Error;
#use Bugzilla::Group;
#use Bugzilla::User;

#use Bugzilla::Extension::Scrums::Teams;
#use Bugzilla::Extension::Scrums::Releases;
#use Bugzilla::Extension::Scrums::Bugrpclib;

#use Data::Dumper;

our $VERSION = '1.0';

#use constant CONST_FEATURE => "feature";
#use constant CONST_TASK    => "task";

sub page_before_template {
    my ($self, $args) = @_;

    my ($vars, $page) = @$args{qw(vars page_id)};

    if ($page eq "EditFieldsInline/ajax.html") {
        my $cgi    = Bugzilla->cgi;
        my $schema = $cgi->param('schema');
        if ($schema eq "bug") {
            #            my $msg = update_bug_fields_from_json($vars);
            #            $vars->{errors} = $msg;
            update_bug_fields_from_json($vars);
        }
    }
}

# This must be the last line of your extension.
__PACKAGE__->NAME;

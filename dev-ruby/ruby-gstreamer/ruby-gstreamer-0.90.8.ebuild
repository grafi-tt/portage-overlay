# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gstreamer/ruby-gstreamer-0.19.4.ebuild,v 1.4 2010/10/20 21:55:41 ranger Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2-r1

DESCRIPTION="Ruby GStreamer bindings"
KEYWORDS="amd64 ppc x86"
IUSE=""

RDEPEND="${RDEPEND}
	=media-libs/gstreamer-0.10*
	=media-libs/gst-plugins-base-0.10*"
DEPEND="${DEPEND}
	=media-libs/gstreamer-0.10*
	=media-libs/gst-plugins-base-0.10*"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
ruby_add_bdepend "dev-ruby/pkg-config"

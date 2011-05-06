# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gtk2/ruby-gtk2-0.19.4.ebuild,v 1.6 2011/03/01 18:44:01 graaff Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2-r1

DESCRIPTION="Ruby Gtk2 bindings"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""

RDEPEND="${RDEPEND} x11-libs/gtk+:2"
DEPEND="${DEPEND} x11-libs/gtk+:2"

ruby_add_rdepend ">=dev-ruby/ruby-gdk-pixbuf2-${PV}
	>=dev-ruby/ruby-glib2-${PV}
	>=dev-ruby/ruby-pango-${PV}
	>=dev-ruby/ruby-atk-${PV}"
ruby_add_bdepend "dev-ruby/pkg-config"

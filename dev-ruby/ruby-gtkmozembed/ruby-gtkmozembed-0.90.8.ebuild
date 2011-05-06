# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gtkmozembed/ruby-gtkmozembed-0.19.4-r1.ebuild,v 1.5 2010/10/20 21:57:52 ranger Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2-r1

DESCRIPTION="Ruby/GTK bindings for Mozilla"
KEYWORDS="amd64 ~ia64 ppc sparc x86"
IUSE=""

RDEPEND="${RDEPEND}
	net-libs/xulrunner"
DEPEND="${DEPEND}
	net-libs/xulrunner"

RUBY_PATCHES=( "${P}-xulrunner-1.9.2.patch" )

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}
	>=dev-ruby/ruby-pango-${PV}
	>=dev-ruby/ruby-gtk2-${PV}"
ruby_add_bdepend "dev-ruby/pkg-config"
# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-gtksourceview/ruby-gtksourceview-0.19.4.ebuild,v 1.5 2010/10/20 21:58:24 ranger Exp $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2-r1

DESCRIPTION="Ruby bindings for gtksourceview"
KEYWORDS="amd64 ~ia64 ppc sparc x86"
IUSE=""

RDEPEND="${RDEPEND}
	=x11-libs/gtksourceview-2*"
DEPEND="${DEPEND} =x11-libs/gtksourceview-2*"

ruby_add_rdepend ">=dev-ruby/ruby-gtk2-${PV}"
ruby_add_bdepend "dev-ruby/pkg-config"
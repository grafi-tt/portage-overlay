# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-ruby/ruby-glib2/ruby-glib2-0.19.4.ebuild,v 1.7 2011/01/21 17:04:43 xarthisius Exp $

EAPI="2"
USE_RUBY="ruby18"

inherit ruby-ng-gnome2-r1

DESCRIPTION="Ruby Glib2 bindings"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86 ~x86-macos"
IUSE=""
RDEPEND="${RDEPEND} >=dev-libs/glib-2"
DEPEND="${DEPEND} >=dev-libs/glib-2"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
ruby_add_bdepend "dev-ruby/pkg-config"

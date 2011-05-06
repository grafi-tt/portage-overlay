# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19"

inherit ruby-ng-gnome2-r1

DESCRIPTION="Ruby Atk bindings"
KEYWORDS="alpha amd64 ia64 ppc sparc x86"
IUSE=""
DEPEND="${DEPEND} dev-libs/atk"
RDEPEND="${RDEPEND} dev-libs/atk"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
ruby_add_bdepend "dev-ruby/pkg-config"

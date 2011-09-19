# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_DOCDIR="doc/yardoc"
RUBY_FAKEGEM_EXTRADOC="ChangeLog NEWS.md README.md"

inherit ruby-fakegem

DESCRIPTION="Cri is a library for building easy-to-use commandline tools."
HOMEPAGE="http://rubygems.org/gems/cri"
LICENSE="MIT"

ruby_add_rdepend "
	doc? (
		dev-ruby/yard
	)
	test? (
		virtual/ruby-minitest
	)
"

KEYWORDS="~amd64 ~x86"
SLOT="0"

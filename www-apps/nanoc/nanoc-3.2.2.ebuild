# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 ruby19 ree18"

RUBY_FAKEGEM_TASK_DOC="doc"
RUBY_FAKEGEM_DOCDIR="doc/yardoc"
RUBY_FAKEGEM_EXTRADOC="ChangeLog NEWS.md README.md"
RUBY_FAKEGEM_NAME="nanoc3"

inherit ruby-fakegem

DESCRIPTION="a web publishing system written in Ruby for building small to medium-sized websites."
HOMEPAGE="http://nanoc.stoneship.org/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="3"
IUSE=""

ruby_add_rdepend "dev-ruby/cri"

ruby_add_bdepend "
	test? (
		dev-ruby/minitest
		dev-ruby/mocha
	)
	doc? (
		dev-ruby/rdiscount
		dev-ruby/yard
	)"

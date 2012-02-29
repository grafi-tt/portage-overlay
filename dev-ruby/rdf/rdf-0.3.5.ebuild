# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"
RUBY_S="gkellogg-rdf-*"

RUBY_FAKEGEM_EXTRADOC="README.md CREDITS AUTHORS"
RUBY_FAKEGEM_EXTRAINSTALL="VERSION etc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc/yard"

inherit ruby-fakegem

DESCRIPTION="RDF.rb is a pure-Ruby library for working with Resource Description Framework (RDF) data."
HOMEPAGE="http://rdf.rubyforge.org/"
V_COMMIT="f6f3bb512a3cc79305b3fa986a7c0bb2af046a28"
SRC_URI="https://github.com/gkellogg/rdf/tarball/${V_COMMIT}"
LICENSE="Unlicense"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/yard )"
ruby_add_rdepend "dev-ruby/addressable"
ruby_add_bdepend "test? ( dev-ruby/rspec )"

all_ruby_unpack () {
	tar xzf "${DISTDIR}/${A}" || die
}

all_ruby_prepare() {
	sed -i -e "/^require.*bundler\/setup/d" spec/spec_helper.rb || die
}

all_ruby_compile () {
	all_fakegem_compile
	if use doc; then
		yard doc || die
	fi
}

each_ruby_test() {
	${RUBY} -S rspec spec || die
}

# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_S="gkellogg-rdf-spec-*"
RUBY_PATCHES="${PN}-0.3.5-fixtempfile.patch"

RUBY_FAKEGEM_EXTRADOC="README.md CREDITS AUTHORS"
RUBY_FAKEGEM_EXTRAINSTALL="VERSION etc"
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR="doc/yard"

inherit ruby-fakegem

DESCRIPTION="RDF.rb plugin that provides RSpec matchers and shared examples for RDF objects."
HOMEPAGE="http://rdf.rubyforge.org/spec/"
V_COMMIT="061ebcd000731d55a41ad93b70f6e1330ef9633c"
SRC_URI="https://github.com/gkellogg/rdf-spec/tarball/${V_COMMIT}"
LICENSE="Unlicense"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "doc? ( dev-ruby/yard )"
ruby_add_rdepend "dev-ruby/rspec"
ruby_add_bdepend "test? ( ~dev-ruby/rdf-${PV} )"

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

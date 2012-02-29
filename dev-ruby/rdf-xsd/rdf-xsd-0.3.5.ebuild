# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"
RUBY_S="gkellogg-${PN}-*"

RUBY_FAKEGEM_EXTRADOC="README.markdown AUTHORS"
RUBY_FAKEGEM_EXTRAINSTALL="VERSION"
RUBY_FAKEGEM_TASK_DOC="doc:yard"
RUBY_FAKEGEM_TAKS_TEST="spec"
RUBY_FAKEGEM_DOCDIR="doc/yard"

inherit ruby-fakegem

DESCRIPTION="Adds RDF::Literal subclasses for extended XSD datatypes."
HOMEPAGE="http://github.com/gkellogg/rdf-rdfxml"
V_COMMIT="ccd6f01eefdfb22eebddaba258a795e2a9b2ec14"
SRC_URI="https://github.com/gkellogg/${PN}/tarball/${V_COMMIT}"
LICENSE="Unlicense"
RESTRICT="test"

KEYWORDS="~amd64"
SLOT="0"
IUSE="+nokogiri"

ruby_add_bdepend "
	test? (
		dev-ruby/rspec
		dev-ruby/nokogiri
		>=dev-ruby/activesupport-3.0.0
		dev-ruby/equivalent-xml
		dev-ruby/rdf-spec
	)
	doc? ( dev-ruby/yard )
"
ruby_add_rdepend "
	nokogiri? ( dev-ruby/nokogiri )
	dev-ruby/rdf
"

all_ruby_unpack () {
	tar xzf "${DISTDIR}/${A}" || die
}

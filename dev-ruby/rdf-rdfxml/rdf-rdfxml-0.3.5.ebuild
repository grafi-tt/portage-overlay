# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"
RUBY_S="gkellogg-${PN}-*"

RUBY_FAKEGEM_EXTRADOC="README.markdown History.markdown AUTHORS CONTRIBUTORS"
RUBY_FAKEGEM_EXTRAINSTALL="VERSION"
RUBY_FAKEGEM_TASK_DOC="doc:yard"
RUBY_FAKEGEM_TAKS_TEST="spec"
RUBY_FAKEGEM_DOCDIR="doc/yard"

inherit ruby-fakegem

DESCRIPTION="RDF::RDFXML is an RDF/XML reader and writer for the RDF.rb library suite."
HOMEPAGE="http://github.com/gkellogg/rdf-rdfxml"
V_COMMIT="05739d4de681ffab652387a5c0897354a7a6e4d7"
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
		dev-ruby/equivalent-xml
		dev-ruby/open-uri-cached
		dev-ruby/spira
		dev-ruby/rdf-spec
		dev-ruby/rdf-turtle
		dev-ruby/rdf-rdfxml
		dev-ruby/rdf-isomorphic
		dev-ruby/rdf-n3
	)
	doc? ( dev-ruby/yard )
"
ruby_add_rdepend "
	nokogiri? ( dev-ruby/nokogiri )
	dev-ruby/rdf
	dev-ruby/rdf-xsd
"

all_ruby_unpack () {
	tar xzf "${DISTDIR}/${A}" || die
}

# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby19"
RUBY_S="gkellogg-rdf-rdfa-*"

RUBY_FAKEGEM_EXTRADOC="README.markdown History.markdown AUTHORS CONTRIBUTORS"
RUBY_FAKEGEM_EXTRAINSTALL="VERSION"
RUBY_FAKEGEM_TASK_DOC="doc:yard"
RUBY_FAKEGEM_TAKS_TEST="spec"
RUBY_FAKEGEM_DOCDIR="doc/yard"

inherit ruby-fakegem

DESCRIPTION="RDF::RDFa is an RDFa reader/writer for Ruby using the RDF.rb library suite."
HOMEPAGE="http://github.com/gkellogg/rdf-rdfa"
V_COMMIT="b9d5ac4f55c60cbe6b52a8724f3944dc4b6e7126"
SRC_URI="https://github.com/gkellogg/${PN}/tarball/${V_COMMIT}"
LICENSE="Unlicense"
RESTRICT="test"

KEYWORDS="~amd64"
SLOT="0"
IUSE="+nokogiri"

ruby_add_bdepend "doc? ( dev-ruby/yard )"
ruby_add_rdepend "
	test? (
		dev-ruby/equivalent-xml
		dev-ruby/open-uri-cached
		dev-ruby/spira
		dev-ruby/sparql
		dev-ruby/rdf-spec
		dev-ruby/rdf-turtle
		dev-ruby/rdf-rdfxml
		dev-ruby/rdf-isomorphic
	)
	doc? (
		dev-ruby/yard
	)
	nokogiri? ( dev-ruby/nokogiri )
	dev-ruby/haml
	dev-ruby/htmlentities
"
ruby_add_bdepend "test? ( dev-ruby/rspec )"

all_ruby_unpack () {
	tar xzf "${DISTDIR}/${A}" || die
}

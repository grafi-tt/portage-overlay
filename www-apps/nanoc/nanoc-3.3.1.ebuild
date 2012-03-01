# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="ChangeLog NEWS.md README.md"
RUBY_FAKEGEM_BINWRAP="nanoc"

RUBY_FAKEGEM_TASK_DOC="doc"

RUBY_FAKEGEM_VERSION=${PV/_alpha/a}

inherit ruby-fakegem

DESCRIPTION="nanoc is a simple but very flexible static site generator written in Ruby."
HOMEPAGE="http://nanoc.stoneship.org/"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE="asciidoc bluecloth coffeescript colorize_syntax erubis haml
kramdown markaby maruku mustache rainpress rdiscount rdoc redcarpet redcloth
recloth relativepaths rubypants sass slim typogruby uglifier xsl
yui-compressor"

# TODO: pygements.rb, lesscss, rainpress, slim
ruby_add_rdepend "
	>=dev-ruby/cri-2.1.0
	test? (
		virtual/ruby-minitest
		dev-ruby/mocha
	)
	doc? (
		dev-ruby/yard
		dev-ruby/rdiscount
	)
	asciidoc? ( app-text/asciidoc dev-ruby/systemu )
	bluecloth? ( dev-ruby/bluecloth )
	colorize_syntax? (
		dev-ruby/nokogiri
		|| (
			dev-ruby/coderay
			( dev-ruby/systemu dev-python/pygments )
			( dev-ruby/systemu app-text/highlight )
		)
	)
	coffeescript? ( dev-ruby/coffee-script )
	erubis? ( dev-ruby/erubis )
	haml? ( dev-ruby/haml )
	kramdown? ( dev-ruby/kramdown )
	markaby? ( dev-ruby/markaby )
	maruku? ( dev-ruby/maruku )
	mustache? ( dev-ruby/mustache )
	rainpress? ( dev-ruby/rainpress )
	relativepaths? ( dev-ruby/nokogiri )
	rdiscount? ( dev-ruby/rdiscount )
	rdoc? ( virtual/ruby-rdoc )
	redcarpet? ( dev-ruby/redcarpet )
	redcloth? ( dev-ruby/redcloth )
	rubypants? ( dev-ruby/rubypants )
	sass? ( dev-ruby/sass )
	slim? ( dev-ruby/slim )
	typogruby? ( dev-ruby/slim )
	uglifier? ( dev-ruby/uglifier )
	xsl? ( dev-ruby/nokogiri )
	yui-compressor? ( dev-ruby/yui-compressor )
"
all_ruby_install() {
	all_fakegem_install
	ruby_fakegem_binwrapper nanoc nanoc3
}

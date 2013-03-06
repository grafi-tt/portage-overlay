EAPI="4"
USE_RUBY="ruby18 ruby19"
IUSE="doc test"

RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_TASK_TEST=""

inherit ruby-fakegem

DESCRIPTION="Ruby interface for the taglib C++ library"
HOMEPAGE="http://robinst.github.com/taglib-ruby/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"

RDEPEND="media-libs/taglib"
ruby_add_bdepend "
	>=dev-ruby/rake-compiler-0.8
	test? ( >=dev-ruby/should-context-1.0 )
	doc? ( >=dev-ruby/yard-0.7 )"

each_ruby_configure() {
	for extconf in ext/*/extconf.rb; do
		pushd ${extconf%extconf.rb}
		CONFIGURE_ARGS=" --with-opt-dir= " ${RUBY} extconf.rb || die "extconf failed"
		popd
	done
}

all_ruby_compile() {
	if use doc; then
		yard doc --title ${PN} || die "yard failed"
	fi
}

each_ruby_compile() {
	for extconf in ext/*/extconf.rb; do
		pushd ${extconf%extconf.rb}
		emake || die "emake fialed"
		popd
	done

	if use test; then
		${RUBY} test/*_test.rb || die "tests failed"
	fi
}

each_ruby_install() {
	mv ext/*/*.bundle lib
	each_fakegem_install
}

EAPI="4"
USE_RUBY="ruby18 ruby19"

RUBY_FAKEGEM_EXTRADOC="CHANGES.md README.md"

RUBY_FAKEGEM_TASK_DOC="yard"
RUBY_FAKEGEM_TASK_TEST="test"

inherit ruby-fakegem

DESCRIPTION="Ruby interface for the taglib C++ library"
HOMEPAGE="http://robinst.github.com/taglib-ruby/"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE="${IUSE} minimal"

RDEPEND="media-libs/taglib"
ruby_add_bdepend "
	>=dev-ruby/rake-compiler-0.8
	test? ( >=dev-ruby/should-context-1.0 )
	doc? ( >=dev-ruby/yard-0.7 )"

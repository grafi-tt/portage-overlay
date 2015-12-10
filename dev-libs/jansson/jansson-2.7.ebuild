# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/jansson/jansson-2.7.ebuild,v 1.2 2015/05/24 13:49:51 vapier Exp $

EAPI="5"
AUTOTOOLS_AUTORECONF=1

inherit autotools-multilib

DESCRIPTION="C library for encoding, decoding and manipulating JSON data"
HOMEPAGE="http://www.digip.org/jansson/"
SRC_URI="http://www.digip.org/jansson/releases/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE="doc static-libs"

DEPEND="doc? ( >=dev-python/sphinx-1.0.4 )"
RDEPEND=""

DOCS=(CHANGES README.rst)

src_prepare() {
	sed -ie 's/-Werror//' src/Makefile.am || die
	autotools-multilib_src_prepare
}

multilib_src_compile() {
	autotools-utils_src_compile
	use doc && multilib_is_native_abi && autotools-utils_src_compile html
}

multilib_src_install() {
	use doc && multilib_is_native_abi && DOCS= HTML_DOCS="${AUTOTOOLS_BUILD_DIR}/doc/_build/html/" einstalldocs
	emake DESTDIR="${D}" install || die
}

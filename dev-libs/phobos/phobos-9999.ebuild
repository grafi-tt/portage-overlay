# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

EAPI="2"

DESCRIPTION="The Phobos standard library for DMD"
HOMEPAGE="http://www.digitalmars.com/d/"

LICENSE="DMD"
RESTRICT="mirror strip binchecks"
SLOT="2"
KEYWORDS="~x86 ~amd64"
IUSE=""
EAPI="2"

DEPEND="=dev-lang/dmd-${PV}"
RDEPEND="${DEPEND}"

src_compile() {
# druntime
	svn co http://svn.dsource.org/projects/druntime/trunk druntime
	cd "druntime"
	make -f posix.mak || die "Druntime compilation failed"
	#cp ../lib/libdruntime.a ..
# Phobos
	cd "${WORKDIR}"
	svn co http://svn.dsource.org/projects/phobos/trunk/phobos phobos
	cd "phobos"
	emake -f posix.mak || die "Phobos compilation failed"
}

src_install() {
# lib
	dolib.a "${WORKDIR}/phobos/generated/linux/release/libphobos2.a" || die "Install failed"
}

# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit mono-env autotools eutils git-r3
unset SRC_URI

DESCRIPTION="C# Bindings for libsoup2.4"
HOMEPAGE="https://github.com/stsundermann/soup-sharp"
EGIT_REPO_URI="git://github.com/stsundermann/${PN}.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-lang/mono-2.11
	>=dev-dotnet/gtk-sharp-2.99.2:3
	net-libs/libsoup"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eautoreconf -I . -I m4
}

#src_compile() {
#	emake -j1
#}

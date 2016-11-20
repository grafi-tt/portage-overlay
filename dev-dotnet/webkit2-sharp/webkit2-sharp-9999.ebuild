# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit mono-env autotools eutils git-r3
unset SRC_URI

DESCRIPTION=" C# bindings for WebKit 2 with GTK+ 3 "
HOMEPAGE="https://github.com/hbons/webkit2-sharp"
EGIT_REPO_URI="git://github.com/hbons/${PN}.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	>=dev-lang/mono-2.11
	>=dev-dotnet/gtk-sharp-2.99.2:3
	net-libs/webkit-gtk:4="
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	eautoreconf -I . -I m4
}

#src_compile() {
#	emake -j1
#}

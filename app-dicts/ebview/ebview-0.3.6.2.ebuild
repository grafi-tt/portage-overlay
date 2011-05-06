# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-dicts/ebview/ebview-0.3.6.ebuild,v 1.7 2008/01/09 15:22:04 armin76 Exp $

inherit eutils

IUSE=""

DESCRIPTION="EBView -- Electronic Book Viewer based on GTK+"
HOMEPAGE="http://ebview.sourceforge.net/"
#SRC_URI="http://ftp.de.debian.org/debian/pool/main/e/ebview/${P}.orig.tar.gz"
SRC_URI="http://ftp.de.debian.org/debian/pool/main/e/ebview/ebview_0.3.6.2.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ppc"

RDEPEND=">=dev-libs/eb-3.3.4
	>=x11-libs/gtk+-2.2"
DEPEND="${RDEPEND}
	sys-devel/gettext
	dev-util/pkgconfig"

src_unpack() {
	unpack ${A}

	cd "${S}"
	epatch "${FILESDIR}"/${P}-destdir.diff
}

src_compile() {
	econf --with-eb-conf=/etc/eb.conf || die "econf failed"
	emake || die "emake failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
	
	mkdir -p "${D}"/usr/share/applications
	mkdir -p "${D}"/usr/share/pixmaps
	cp "${FILESDIR}"/ebview.desktop "${D}"/usr/share/applications/
	cp "${S}"/pixmaps/ebview-32x32.xpm "${D}"/usr/share/pixmaps/ebview.xpm

	dodoc AUTHORS ChangeLog INSTALL* NEWS README TODO
}

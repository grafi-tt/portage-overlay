# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
MY_P="${P%.*}+media-${P##*.}"

DESCRIPTION="Interactive search utility for electronic dictionaries"
HOMEPAGE="http://ikazuhiro.s206.xrea.com/staticpages/index.php/eblook"
SRC_URI="http://ikazuhiro.s206.xrea.com/filemgmt_data/files/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ppc x86"
IUSE=""

DEPEND=">=dev-libs/eb-3.3.4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	sed \
		-e 's:LDFAGS:LDFLAGS:g' \
		-i configure || die
}

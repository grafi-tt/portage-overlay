# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit font

MY_PV_URINUM="52283"
MY_PN="Migu"
DESCRIPTION="M+ Japanese outline fonts mixed with IPA font and modified"
HOMEPAGE="http://mix-mplus-ipa.sourceforge.jp/"

SRC_URI="
	mirror://sourceforge.jp/mix-mplus-ipa/${MY_PV_URINUM}/${MY_PN}-1C-${PV}.zip
	mirror://sourceforge.jp/mix-mplus-ipa/${MY_PV_URINUM}/${MY_PN}-1M-${PV}.zip
	mirror://sourceforge.jp/mix-mplus-ipa/${MY_PV_URINUM}/${MY_PN}-1P-${PV}.zip
"

LICENSE="mplus-fonts IPAfont"
SLOT="0"
KEYWORDS="~amd64 ~arm ~hppa ~ia64 ~ppc ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

FONT_SUFFIX="ttf"
FONT_S="${WORKDIR}"
FONTDIR="/usr/share/fonts/${MY_PN}"

RESTRICT="strip binchecks"

src_install () {
	insinto "${FONTDIR}"
	for f in "1C" "1M" "1P"; do
		cd ${WORKDIR}/${MY_PN}-${f}-${PV}
		doins *.${FONT_SUFFIX} || die
		newdoc ${MY_PN}-README.txt ${MY_PN}-README.${f}.txt
	done

	font_xfont_config
	font_fontconfig
}

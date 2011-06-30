# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit font

MY_PN="MigMix"
DESCRIPTION="M+ Japanese outline fonts mixed with IPA font"
HOMEPAGE="http://mix-mplus-ipa.sourceforge.jp/"

SRC_URI="
	mirror://sourceforge.jp/mix-mplus-ipa/51709/${MY_PN}-1M-${PV}.zip
	mirror://sourceforge.jp/mix-mplus-ipa/51709/${MY_PN}-1P-${PV}.zip
	mirror://sourceforge.jp/mix-mplus-ipa/51709/${MY_PN}-2M-${PV}.zip
	mirror://sourceforge.jp/mix-mplus-ipa/51709/${MY_PN}-2P-${PV}.zip
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
	for f in "1M" "1P" "2M" "2P"; do
		cd ${WORKDIR}/${MY_PN}-${f}-${PV}
		doins *.${FONT_SUFFIX} || die
		newdoc ${MY_PN}-README.txt ${MY_PN}-README.${f}.txt
	done

	font_xfont_config
	font_fontconfig
}

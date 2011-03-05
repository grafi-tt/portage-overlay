# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit games

DESCRIPTION="An unquestionably awesome 2D game engine"
HOMEPAGE="http://love2d.org/"
SRC_URI="http://bitbucket.org/rude/love/downloads/${P}-linux-src.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="luajit"

DEPEND="media-libs/libsdl[joystick]
	media-libs/sdl-sound
	media-libs/openal
	luajit? ( dev-lang/luajit )
	!luajit? ( dev-lang/lua )
	media-libs/devil
	media-libs/libmng
	media-libs/freetype
	dev-games/physfs
	media-libs/libmodplug
	media-sound/mpg123
	media-libs/libvorbis"

RDEPEND="${DEPEND}"

S=${WORKDIR}/${P}

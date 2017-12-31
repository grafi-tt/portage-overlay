# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

IUSE="cuda91"

PKG_9_1="cudnn-9.1-linux-x64-v7"
PKG_9_0="cudnn-9.0-linux-x64-v7"

SRC_URI="
	cuda91?  ( "${PKG_9_1}.tgz" )
	!cuda91? ( "${PKG_9_0}.tgz" )
"

DESCRIPTION="NVIDIA cuDNN GPU Accelerated Deep Learning"
HOMEPAGE="https://developer.nvidia.com/cuDNN"

SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
RESTRICT="fetch"
LICENSE="NVIDIA-cuDNN"

RDEPEND="
	cuda91?  ( =dev-util/nvidia-cuda-toolkit-9.1* )
	!cuda91? ( =dev-util/nvidia-cuda-toolkit-9.0* )
"

pkg_nofetch() {
	einfo "Please download"
	einfo "  - ${SRC_URI}"
	einfo "from ${HOMEPAGE} and place them in ${DISTDIR}"
}

src_unpack() {
	default
	mv cuda "${P}"
}

src_install() {
	into /opt/cuda
	dolib.so lib64/libcudnn*.so*
	dolib.a lib64/libcudnn_static.a

	insinto /opt/cuda/include
	doins include/cudnn.h

	dodoc NVIDIA_SLA_cuDNN_Support.txt
}

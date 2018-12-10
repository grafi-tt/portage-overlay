# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools linux-info

DESCRIPTION="TCG Trusted Platform Module 2.0 Software Stack"
HOMEPAGE="https://github.com/tpm2-software/tpm2-tss"
SRC_URI="https://github.com/tpm2-software/${PN}/releases/download/${PV}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc gcrypt libressl static-libs"

BDEPEND="virtual/pkgconfig
	doc? ( app-doc/doxygen )"
DEPEND="
	gcrypt? ( dev-libs/libgcrypt:0= )
	!gcrypt? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)"
RDEPEND="${DEPEND}"

# https://github.com/tpm2-software/tpm2-tss/commit/74037d3c15b9f9d98f9b50ca4f1c1a99d239d751
PATCHES=(
	"${FILESDIR}/tpm2-tss-2.1.0-cflags-configure.patch"
)

pkg_setup() {
	linux-info_pkg_setup
	local tpm_kernel_version tpm_kernel_present
	kernel_is ge 4 12 0 && tpm_kernel_version="yes"
	if linux_config_exists; then
		linux_chkconfig_present TCG_TPM && tpm_kernel_present="yes"
	else
		ewarn "No kernel configuration could be found."
	fi
	if [[ -n "${tpm_kernel_present}" ]]; then
		einfo "Good, you seem to have in-kernel TPM support."
	elif [[ -n "${tpm_kernel_version}" ]]; then
		eerror
		eerror "To use this package, you will have to activate TPM support"
		eerror "in your kernel configuration. That's at least CONFIG_TCG_TPM,"
		eerror "plus probably a chip specific driver (like CONFIG_TCG_TIS)."
		eerror
	else
		eerror
		eerror "To use this package, you must install a kernel newer than"
		eerror "4.12.0 and enable TPM support."
		eerror
	fi
}

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf \
		$(use_enable doc doxygen-doc) \
		$(use gcrypt && echo --with-crypto=gcrypt) \
		$(use !gcrypt && echo --with-crypto=ossl) \
		$(use_enable static-libs static)
}

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{4,5,6} )
DISTUTILS_SINGLE_IMPL=1
PYTHON_REQ_USE="ssl,xml"

inherit distutils-r1 git-r3 linux-info systemd udev

DESCRIPTION="cloud initialisation magic"
HOMEPAGE="https://github.com/Azure/WALinuxAgent"
#EGIT_REPO_URI="https://github.com/Azure/${PN}"
EGIT_REPO_URI="https://github.com/grafi-tt/${PN}"

# LibreSSL doesn't support CMS, so use a single-function cms command,
# ported from OpenSSL source, as OpenBSD team does.
CLOUD_AGENT_PV="0.6"
SRC_URI="
	libressl? (
		https://github.com/reyk/cloud-agent/archive/v${CLOUD_AGENT_PV}.tar.gz ->
		cloud-agent-${CLOUD_AGENT_PV}.tar.gz
	)
"
CMS_P="cloud-agent-${CLOUD_AGENT_PV}/cms"
LIBEXEC="/usr/libexec/waagent"

LICENSE="Apache-2.0 libressl? ( openssl )"
SLOT="0"
KEYWORDS=""
IUSE="f2fs +firewall libressl systemd test xfs"

CDEPEND="
	sys-apps/grep
	>=sys-apps/sed-4
	virtual/awk
	!libressl? ( dev-libs/openssl:0= )
	libressl? ( dev-libs/libressl:0= )
"
DEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		${CDEPEND}
		dev-python/mock[${PYTHON_USEDEP}]
	)
"
RDEPEND="
	${CDEPEND}
	app-admin/sudo
	net-misc/openssh
	sys-process/procps
	sys-apps/coreutils
	sys-apps/iproute2
	sys-apps/util-linux
	sys-block/parted
	sys-fs/e2fsprogs
	virtual/udev
	firewall? ( net-firewall/iptables )
	systemd? ( sys-apps/systemd )
	!systemd? ( net-misc/dhcpcd )
	f2fs? ( sys-fs/f2fs-tools )
	xfs? ( sys-fs/xfsprogs )
"

PATCHES=(
	"${FILESDIR}"/"${PN}"-no-p7m-recip-key.patch
)

CONFIG_CHECK=""

src_unpack() {
	git-r3_src_unpack
	use libressl && unpack ${A}
}

pkg_setup() {
	use firewall && CONFIG_CHECK+=" ~IP_NF_SECURITY"
	use f2fs && CONFIG_CHECK+=" ~F2FS_FS"
	use xfs && CONFIG_CHECK+=" ~XFS_FS"
	linux-info_pkg_setup
	python-single-r1_pkg_setup
}

python_prepare_all() {
	sed -i "s/\\(self\\.agent_conf_file_path\\) = \\(.*\\)/\\1 = '${EPREFIX}' \\2/" \
		"${S}"/azurelinuxagent/common/osutil/default.py || die

	sed -i "s:OS\\.OpensslPath=None:OS\\.OpensslPath=/usr/bin/openssl:" \
		"${S}"/config/waagent.conf || die
	for key in "OS\\.OpensslPath" "Lib\\.Dir" "Pid\\.File" "Extension\\.LogDir"; do
		sed -i "s:^[# ]*\\(${key}\\)=\\(.*\\):\\1=${EPREFIX}\\2:" \
			"${S}"/config/waagent.conf || die
	done

	use firewall && firewall_val="y" || firewall_val="n"
	sed -i "s/^[# ]*\\(OS\\.EnableFirewall\\)=.*/\\1=${firewall_val}/" \
		"${S}"/config/waagent.conf || die

	for fs in f2fs xfs; do
		if use ${fs}; then
			sed -i "s/^[# ]*\\(ResourceDisk\\.Filesystem\\)=.*/\\1=${fs}/" \
				"${S}"/config/waagent.conf || die
		fi
	done

	if use libressl; then
		cp "${FILESDIR}"/Makefile.cms "${WORKDIR}/${CMS_P}" || die
		sed -i "s:/usr/bin/openssl:${LIBEXEC}/openssl-wrapper:" \
			"${S}"/config/waagent.conf || die
	fi

	distutils-r1_python_prepare_all
}

python_compile_all() {
	use libressl && emake -C "${WORKDIR}/${CMS_P}" -f Makefile.cms
}

python_install() {
	distutils-r1_python_install "--skip-data-files"

	sed -i "1s:^#!/usr/bin/env python$:#!${EPYTHON}:" "${S}"/bin/waagent
	dosbin "${S}"/bin/waagent
}

python_install_all() {
	distutils-r1_python_install_all

	insinto /etc
	doins "${S}"/config/waagent.conf

	insinto /etc/logrotate.d
	doins "${S}"/config/waagent.logrotate

	if use libressl; then
		exeinto "${LIBEXEC}"
		doexe "${WORKDIR}/${CMS_P}"/bin/cms
		doexe "${FILESDIR}"/openssl-wrapper
	fi

	newinitd "${S}"/init/gentoo/waagent waagent
	systemd_dounit "${S}"/init/waagent.service
	udev_dorules "${S}"/config/*.rules
}

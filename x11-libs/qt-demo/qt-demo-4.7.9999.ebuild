# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
inherit qt4-build-edge

DESCRIPTION="Demonstration module of the Qt toolkit"
SLOT="4"
KEYWORDS=""
IUSE=""

DEPEND="~x11-libs/qt-assistant-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-core-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-dbus-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-gui-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-multimedia-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-opengl-${PV}:${SLOT}[kde-qt=,stable-branch=]
	|| ( ~x11-libs/qt-phonon-${PV}:${SLOT}[kde-qt=,stable-branch=] media-sound/phonon )
	~x11-libs/qt-script-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-sql-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-svg-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-test-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-webkit-${PV}:${SLOT}[kde-qt=,stable-branch=]
	~x11-libs/qt-xmlpatterns-${PV}:${SLOT}[kde-qt=,stable-branch=]"

RDEPEND="${DEPEND}"

QT4_TARGET_DIRECTORIES="demos
	examples"
QT4_EXTRACT_DIRECTORIES="${QT4_TARGET_DIRECTORIES}
	doc/src/images
	src/
	include/
	tools/"

PATCHES=(
	"${FILESDIR}/${PN}-4.6-plugandpaint.patch"
)

src_install() {
	insinto ${QTDOCDIR}/src
	doins -r "${S}"/doc/src/images || die "Installing images failed."

	qt4-build-edge_src_install
}
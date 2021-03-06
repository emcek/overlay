# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils versionator

MY_V=$(get_version_component_range 1-3)
MY_P="Sublime%20Text"
MY_T=/opt/${PN}
S="${WORKDIR}/Sublime Text 2"

DESCRIPTION="Sublime Text is a sophisticated text editor for code, html and prose"
HOMEPAGE="http://www.sublimetext.com"
COMMON_URI="http://c758482.r82.cf2.rackcdn.com"
SRC_URI="amd64? ( ${COMMON_URI}/${MY_P}%20${MY_V}%20x64.tar.bz2 )
		 x86?   ( ${COMMON_URI}/${MY_P}%20${MY_V}.tar.bz2 )"
LICENSE="SublimeText"
SLOT="2"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="media-libs/libpng:1.2
		 >=x11-libs/gtk+-2.24.8-r1:2"

src_install() {
	insinto ${MY_T}
	into	${MY_T}
	exeinto ${MY_T}
	doins -r "Icon"
	doins -r "lib"
	doins -r "Pristine Packages"
	doins "sublime_plugin.py"
	doins "PackageSetup.py"
	doexe "sublime_text"
	dosym "${MY_T}/sublime_text" /usr/bin/sublime
	make_desktop_entry "/usr/bin/sublime %U" "Sublime Text ${PV}" "${MY_T}/Icon/256x256/sublime_text.png" "Application;TextEditor"
}

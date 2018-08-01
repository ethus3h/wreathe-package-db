# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Futuramerlin Web Toolkit"
HOMEPAGE="https://futuramerlin.com/"
SRC_URI="https://github.com/ethus3h/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="AGPL-3 GPL-2"
SLOT="0"
IUSE="doc"
KEYWORDS="~amd64"
RDEPEND="app-misc/wreathe-base
    dev-perl/HTML-GenToc"
DEPEND="${RDEPEND}
	doc? ( app-misc/futuramerlin-web-toolkit )"

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

case "${PV}" in
	(9999*)
		KEYWORDS=""
		VCS_ECLASS=git-2
		EGIT_REPO_URI="https://github.com/tomszilagyi/${PN}.git"
		EGIT_PROJECT="${PN}.git"
		;;
	(*)
		KEYWORDS="~amd64 ~ppc ~x86"
		SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"
		;;
esac
inherit eutils multilib-minimal ${VCS_ECLASS}

DESCRIPTION="TAP DeEsser, Dynamics, Equalizer, Reverb, Stereo Echo, Tremolo for LADSPA"
HOMEPAGE="http://tap-plugins.sf.net"
SRC_URI+="
	doc? ( mirror://sourceforge/${PN}/${PN}-doc-20140526.tar.gz )"

LICENSE="GPL-2"
SLOT="0"
IUSE="doc"

DEPEND="media-libs/ladspa-sdk[${MULTILIB_USEDEP}]"
RDEPEND="${DEPEND}"

DOCS=( README CREDITS )

src_prepare()
{
	epatch_user
	multilib_copy_sources
}

multilib_src_configure() { :; }
multilib_src_install()
{
	emake install \
		INSTALL_PLUGINS_DIR="${ED}"/usr/$(get_libdir)/ladspa \
		INSTALL_LRDF_DIR="${ED}"/usr/share/ladspa/rdf
}

multilib_src_install_all()
{
	if use doc ; then
		dohtml -r "${WORKDIR}"/"${PN}"-doc-*/*
	fi
}

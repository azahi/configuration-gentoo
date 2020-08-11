# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 meson

DESCRIPTION="An MPD client that submits information to Audioscrobbler"
HOMEPAGE="https://www.musicpd.org/clients/mpdscribble/"
EGIT_REPO_URI="https://github.com/MusicPlayerDaemon/mpdscribble.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-libs/glib:2
	media-libs/libmpdclient
	net-misc/curl
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"
BDEPEND=""

src_install() {
	default
	meson_src_install
	newinitd "${FILESDIR}/mpdscribble" mpdscribble
	keepdir /var/cache/mpdscribble
}

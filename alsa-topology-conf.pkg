# alsa-topology-conf
PKG_VER=1.2.5.1
PKG_URL="https://github.com/alsa-project/alsa-topology-conf/archive/refs/tags/v${PKG_VER}.tar.gz"
BUILD_PROCESS=downloadonly
PKG_DEPS=""
CONF_FLAGS=""
#PKG_MAKETARGETS="all,install"
PKG_PREBUILD="install -v -d -m0755 \${PKG_PKGPATH}${INSTALL_PREFIX}/share/alsa
	cp -RPv topology \${PKG_PKGPATH}${INSTALL_PREFIX}/share/alsa/"

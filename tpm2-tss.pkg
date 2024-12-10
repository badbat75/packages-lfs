# tpm2-tss
PKG_VER=4.1.3
PKG_URL="https://github.com/tpm2-software/tpm2-tss/archive/refs/tags/${PKG_VER}.tar.gz"
PKG_DEPS="lfs/automake:cross lfs/doxygen:native lfs/openssl lfs/json-c lfs/curl lfs/systemd:bootstrap"
PKG_AUTOCONF=1
BUILD_PROCESS=configmake
CONF_FLAGS=
PKG_MAKETARGETS="all,install-strip"

PKG_PREBUILD="sed -e '/^git describe/d' -e '/^\${AUTORECONF}/d' -i bootstrap
    echo 4.0.0 > VERSION
    ./bootstrap"

PKG_POSTINSTALL="if ! getent group tss; then
	groupadd --system tss
fi

if ! getent passwd tss; then
	useradd --system -c \"Account used for TPM access\" -d /dev/null -g tss -s /sbin/nologin tss
fi"
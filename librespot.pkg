# librespot
PKG_VER=0.6.0
PKG_URL="https://github.com/librespot-org/librespot/archive/refs/tags/v${PKG_VER}.tar.gz"
BUILD_PROCESS=cargobuild
CONF_FLAGS="--features alsa-backend"
#PKG_RUSTFLAGS=
PKG_DEPS="lfs/alsa-lib"
CARGO_BINLIST="librespot"
case "${TOOLCHAIN}" in
    llvm) PKG_CFLAGS="-Wno-error=unused-command-line-argument" ;;
esac
PKG_LDFLAGS=-s

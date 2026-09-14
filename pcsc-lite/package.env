# pcsc-lite
PKG_VER=2.2.2
PKG_URL="https://pcsclite.apdu.fr/files/pcsc-lite-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/flex:native lfs/doxygen:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--disable-usb --with-systemdsystemunitdir=/lib/systemd/system --enable-usbdropdir=${INSTALL_LIBDIR}/pcsc/drivers"
PKG_MAKETARGETS="all,install-strip"

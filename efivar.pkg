# efivar
PKG_VER=38
PKG_URL="https://github.com/rhboot/efivar/releases/download/${PKG_VER}/efivar-${PKG_VER}.tar.bz2"
BUILD_PROCESS=simplemake
PKG_MAKETARGETS=",install"
PKG_MAKEVARS="LIBDIR=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}"
PKG_LDFLAGS="-s"

if [ "${HARCH_BITWIDTH}" != 64 ]
then
    PATCHES="https://www.linuxfromscratch.org/patches/blfs/svn/efivar-38-i686-1.patch"
fi

PKG_PREBUILD="sed '/prep :/a\\\\ttouch prep' -i src/Makefile"
PKG_OVERRIDELD=bfd
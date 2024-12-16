# coreutils
PKG_VER=9.5
PKG_URL="https://ftp.gnu.org/gnu/coreutils/coreutils-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--enable-install-program=hostname --enable-no-install-program=kill,uptime"
if [ ${HARCH_BITWIDTH} = 32 ]
then
  CONF_FLAGS+=" --disable-year2038"
fi
CONF_VARS="gl_cv_macro_MB_CUR_MAX_good=yes"
PKG_MAKETARGETS="all,install-strip"

if [ ${LFS_SPLITUSR:-0} -eq 1 ]
then
  PKG_POSTBUILD="mkdir -pv \${PKG_PKGPATH}/bin
    ln -s ../usr/bin/{false,true} \${PKG_PKGPATH}/bin"
fi

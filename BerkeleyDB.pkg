# BerkeleyDB
PKG_VER=5.3.28
PKG_URL="https://anduin.linuxfromscratch.org/BLFS/bdb/db-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/sharutils"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
AUTOCONF_PATH=dist
CONF_PATH=dist
CONF_FLAGS="--enable-dbm --enable-cxx"
#PKG_MAKETARGETS="all,install"

case ${TOOLCHAIN} in
    llvm)
        PKG_CFLAGS="-Wno-deprecated-non-prototype"
        ;;
esac

PKG_PREBUILD="
    sed -i 's/AC_DEFINE(HAVE_SYSTEM_INCLUDE_FILES)/AC_DEFINE(HAVE_SYSTEM_INCLUDE_FILES, [], [Description])/' dist/configure.ac
    sed -i 's/AC_DEFINE(DB_WIN32)/AC_DEFINE(DB_WIN32, [], [Description])/' dist/configure.ac
    . dist/RELEASE
    sed -e \"s/__EDIT_DB_VERSION_FAMILY__/\$DB_VERSION_FAMILY/g\" \
    -e \"s/__EDIT_DB_VERSION_RELEASE__/\$DB_VERSION_RELEASE/g\" \
    -e \"s/__EDIT_DB_VERSION_MAJOR__/\$DB_VERSION_MAJOR/g\" \
    -e \"s/__EDIT_DB_VERSION_MINOR__/\$DB_VERSION_MINOR/g\" \
    -e \"s/__EDIT_DB_VERSION_PATCH__/\$DB_VERSION_PATCH/g\" \
    -e \"s/__EDIT_DB_VERSION_STRING__/\$DB_VERSION_STRING/g\" \
    -e \"s/__EDIT_DB_VERSION_FULL_STRING__/\$DB_VERSION_FULL_STRING/g\" \
    -e \"s/__EDIT_DB_VERSION_UNIQUE_NAME__/\$DB_VERSION_UNIQUE_NAME/g\" \
    -e \"s/__EDIT_DB_VERSION__/\$DB_VERSION/g\" -i dist/configure.ac
    mkdir -pv dist/m4
    cp -fv dist/aclocal/*.m4 dist/aclocal_java/*.m4 dist/m4/
    sed -i 's/\(__atomic_compare_exchange\)/\1_db/' src/dbinc/atomic.h"

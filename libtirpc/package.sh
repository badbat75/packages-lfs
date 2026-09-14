# libtirpc
PKG_VER=1.3.4
PKG_URL="https://downloads.sourceforge.net/libtirpc/libtirpc-${PKG_VER}.tar.bz2"
PKG_DEPS="lfs/krb5:bootstrap"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS=""
CONF_VARS="ac_cv_prog_ac_ct_KRB5_CONFIG=\${SYSROOT}${INSTALL_EXECDIR}/bin/krb5-config"
PKG_MAKETARGETS="all,install-strip"

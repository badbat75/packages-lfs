# cyrus-sasl
PKG_VER=2.1.28
PKG_URL="https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-${PKG_VER}/cyrus-sasl-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/BerkeleyDB lfs/Linux-PAM lfs/krb5 lfs/openldap:bootstrap"
BUILD_PROCESS=configmake
PKG_AUTOCONF=1
CONF_FLAGS="--enable-auth-sasldb"
CONF_FLAGS+=" --with-dbpath=/var/lib/sasl/sasldb2"
CONF_FLAGS+=" --with-sphinx-build=no"
CONF_FLAGS+=" --with-saslauthd=/var/run/saslauthd"
CONF_FLAGS+=" --with-ldap"
CONF_FLAGS+=" --enable-ldapdb"
CONF_ENV="env -u CPPFLAGS"
CONF_VARS="ac_cv_gssapi_supports_spnego=yes"
PKG_MAKETARGETS="all,install-strip"

PKG_POSTBUILD="install -v -dm755 \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cyrus-sasl-${PKG_VER}/html
    install -v -m644 \${PKG_SRCPATH}/saslauthd/LDAP_SASLAUTHD \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cyrus-sasl-${PKG_VER}
    install -v -m644 \${PKG_SRCPATH}/doc/legacy/*.html \${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cyrus-sasl-${PKG_VER}/html
    install -v -dm700 \${PKG_PKGPATH}${INSTALL_LOCALSTATEDIR}/lib/sasl"

PKG_FAULTYCFLAGS=1

case ${TOOLCHAIN} in
    gnu) PKG_CFLAGS="-Wno-cast-function-type -Wno-sign-compare";;
    llvm) PKG_CFLAGS="-Wno-deprecated-non-prototype -Wno-sign-compare";;
esac
PKG_CFLAGS+=" -Wno-implicit-function-declaration"
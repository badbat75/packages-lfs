# shellcheck shell=bash
# shellcheck disable=SC2154
# cyrus-sasl: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -dm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cyrus-sasl-${PKG_VER}/html
    install -v -m644 ${PKG_SRCPATH}/saslauthd/LDAP_SASLAUTHD ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cyrus-sasl-${PKG_VER}
    install -v -m644 ${PKG_SRCPATH}/doc/legacy/*.html ${PKG_PKGPATH}${INSTALL_SHAREDIR}/doc/cyrus-sasl-${PKG_VER}/html
    install -v -dm700 ${PKG_PKGPATH}${INSTALL_LOCALSTATEDIR}/lib/sasl

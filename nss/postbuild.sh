# shellcheck shell=bash
# shellcheck disable=SC2154
# nss: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/{nss,dbm}
    install -vdm755 ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}{,/pkgconfig}
    install -vdm755 ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin
    cp -vRL dist/{public,private}/nss/* ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/nss
    cp -vRL dist/{public,private}/dbm/* ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/dbm
    install -vm755 dist/Release/lib/*.so ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
    install -vm644 dist/Release/lib/*.a ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
    #install -vm644 dist/Release/lib/pkgconfig/* ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig
    #install -vm644 dist/Release/lib/*.chk ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
    ln -sfv ./pkcs11/p11-kit-trust.so ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libnssckbi.so
    install -vm755 dist/Release/bin/* ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin

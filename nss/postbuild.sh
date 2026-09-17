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
    ### The static libraries are the intermediate ones of the nss build, with names of their own
    ### (libnss.a for libnss3.so): they go in only when the project builds static libraries, and then
    ### as fat LTO objects, whose bytecode build removes (strip_lto_objects)
    if [ "${PKG_OVERRIDESTATIC:-${BUILD_LIBSTATIC}}" -eq 1 ]
    then
        install -vm644 dist/Release/lib/*.a ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
    fi
    ### nss.pc comes from the standalone build patch (dist/Release/lib/pkgconfig/nss.pc is a symlink
    ### into nss/config); Poppler and friends find the library through it
    install -vm644 dist/Release/lib/pkgconfig/* ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig
    #install -vm644 dist/Release/lib/*.chk ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
    ln -sfv ./pkcs11/p11-kit-trust.so ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libnssckbi.so
    install -vm755 dist/Release/bin/* ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin

### The Makefile of the patch writes the directories of nss.pc from a fixed /usr: libdir and the -L flag
### are ${prefix}/lib, while the libraries are in the multiarch directory (nss-config reads libdir too)
# shellcheck disable=SC2016
sed -E -e "s@^prefix=.*@prefix=${INSTALL_PREFIX}@" -e "s@^exec_prefix=.*@exec_prefix=${INSTALL_EXECPREFIX}@" \
	-e "s@^libdir=.*@libdir=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}@" -e "s@^includedir=.*@includedir=${INSTALL_INCLUDEDIR}/nss@" \
	-e 's@^(Libs: )-L[^ ]+@\1-L${libdir}@' \
	-i "${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/pkgconfig/nss.pc"

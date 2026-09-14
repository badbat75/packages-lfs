# shellcheck shell=bash
# shellcheck disable=SC2154
# make-ca: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}/etc/ssl/local
    ${PKG_PKGPATH}/usr/sbin/make-ca -s ${GLOBAL_TOOLCHAIN_PATH}/bin/openssl -D ${PKG_PKGPATH} -g

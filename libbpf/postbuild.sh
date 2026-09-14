# shellcheck shell=bash
# shellcheck disable=SC2154
# libbpf: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

${STRIP} --strip-unneeded ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libbpf.so.${PKG_VER}
    install -vm644 ${PKG_SRCPATH}/src/{hashmap.h,libbpf_internal.h,relo_core.h,nlattr.h} ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/bpf

# shellcheck shell=bash
# shellcheck disable=SC2154
# readline: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -v -m644 ${PKG_SRCPATH}/doc/*.{ps,pdf,html,dvi} ${PKG_PKGPATH}/usr/share/doc/readline-${PKG_VER}

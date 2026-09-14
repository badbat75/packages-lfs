# shellcheck shell=bash
# shellcheck disable=SC2154
# cracklib-words: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SHAREDIR}/dict
	bunzip2 -cdv cracklib-words-${PKG_VER}.bz2 > ${PKG_PKGPATH}${INSTALL_SHAREDIR}/dict/cracklib-words
	ln -v -sf cracklib-words ${PKG_PKGPATH}${INSTALL_SHAREDIR}/dict/words

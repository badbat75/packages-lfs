# shellcheck shell=bash
# shellcheck disable=SC2154
# openssh: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i '/^STRIP_OPT/ s/-s$/"-s --strip-program=$STRIP"/' configure.ac
	sed -e '/INSTALLKEYS_SH/s/)//' -e '260a\  )' -i contrib/ssh-copy-id

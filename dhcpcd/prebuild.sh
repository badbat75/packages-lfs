# shellcheck shell=bash
# shellcheck disable=SC2154
# dhcpcd: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed '/Deny everything else/i SECCOMP_ALLOW(__NR_getrandom),' -i src/privsep-linux.c
	sed '/^if \[ -n "$INCLUDEDIR" \]; then/,+2d' -i configure

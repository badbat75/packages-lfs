# shellcheck shell=bash
# sysstat: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Makefile.in appends -O2 to CFLAGS, after the ones of configure: the level is OPTLEVEL
sed -i '/^CFLAGS += / s/ -O2 / /' Makefile.in

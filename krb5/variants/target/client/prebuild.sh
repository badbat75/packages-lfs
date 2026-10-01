# shellcheck shell=bash
# shellcheck disable=SC2154
# krb5:client: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# shellcheck source=/dev/null
source "${PKG_RECIPEPATH}/prebuild.sh"
### The libraries and the user tools (clients, kadmin, ktutil) are built: not the KDC, kadmind, kprop,
### the plugins, the tests. What installs besides the tools is left to split_install
sed -e '/^SUBDIRS=/ s/$/\n__BEGIN_DELETE/' \
	-e '/^WINSUBDIRS=/ s/^/__END_DELETE\n/' -i src/Makefile.in
sed '/^__BEGIN_DELETE/,/^__END_DELETE/d' -i src/Makefile.in
sed 's@^SUBDIRS=.*@SUBDIRS=util include lib clients kadmin/cli kadmin/ktutil man@' -i src/Makefile.in

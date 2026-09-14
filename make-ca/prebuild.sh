# shellcheck shell=bash
# shellcheck disable=SC2154
# make-ca: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's@elif test -d /lib/systemd/system; then \\@else \\@' -i Makefile
# hg.mozilla.org answers with a redirect that openssl s_client cannot follow and the
# mozilla-release repository is gone: take certdata.txt from the NSS repository, as make-ca 1.16 does.
sed -e 's@^\(\s*URL=\).*@\1"https://hg-edge.mozilla.org/projects/nss/raw-file/tip/lib/ckfw/builtins/certdata.txt"@' -i make-ca make-ca.conf.dist

# shellcheck shell=bash
# shellcheck disable=SC2154
# perl5: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

NODELETEDESTDIR=1 download_uncompress https://github.com/arsv/perl-cross/archive/${PKG_PERLCROSS_VER}.tar.gz ${PKG_SRCPATH}

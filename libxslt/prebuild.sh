# shellcheck shell=bash
# shellcheck disable=SC2154
# libxslt: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i s/3000/5000/ libxslt/transform.c doc/xsltproc.{1,xml}

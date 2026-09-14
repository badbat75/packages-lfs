# shellcheck shell=bash
# shellcheck disable=SC2154
# libgmp: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

cp -v configfsf.guess config.guess
  cp -v configfsf.sub   config.sub

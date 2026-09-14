# shellcheck shell=bash
# shellcheck disable=SC2154
# libxml2: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i '/if Py/{s/Py/(Py/;s/)/))/}' python/{types.c,libxml.c}
    sed -i 's/ TRUE/ true/' encoding.c

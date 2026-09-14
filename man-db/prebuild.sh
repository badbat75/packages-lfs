# shellcheck shell=bash
# shellcheck disable=SC2154
# man-db: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

ACLOCAL_FLAGS="--include=${TOOLCHAIN_PATH}/share/autoconf --include=${TOOLCHAIN_PATH}/share/aclocal" ./bootstrap || true
    sed -i '/find/s@/usr@@' -i init/systemd/man-db.service.in

# shellcheck shell=bash
# shellcheck disable=SC2154
# man-db: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### --skip-po: the translations of the gnulib messages are downloaded with wget from the Translation
### Project, the build machine has no wget and a build downloads its sources only (man-db has its own)
ACLOCAL_FLAGS="--include=${TOOLCHAIN_PATH}/share/autoconf --include=${TOOLCHAIN_PATH}/share/aclocal" ./bootstrap --skip-po || true
    sed -i '/find/s@/usr@@' -i init/systemd/man-db.service.in

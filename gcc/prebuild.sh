# shellcheck shell=bash
# shellcheck disable=SC2154
# gcc: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}. Idempotent: the sources
# of the cross targets are prepared once (PKG_KEEPBUILDDIR)

sed '/all-build-libcpp/,/TARGET-build-libcpp/ s/\$(BASE_FLAGS_TO_PASS) //' -i Makefile.in;
### PATH_MAX of the Linux headers
sed 's@^#include <limits.h>@#include <linux/limits.h>@' -i libsanitizer/asan/asan_linux.cpp

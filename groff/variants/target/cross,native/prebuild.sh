# shellcheck shell=bash
# shellcheck disable=SC2154
# groff, target cross or native: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}).
### Host build: the PDF documents run the groff of the build tree through test-groff as upstream
### intends, nothing to change (replaces the target-only Makefile.in edit of the recipe prebuild.sh)
true

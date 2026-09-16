# shellcheck shell=bash
# shellcheck disable=SC2154
# groff: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The PDF documents (doc/*.pdf, contrib/mom examples) run pdfmom with GROFF_COMMAND=test-groff,
### a build tree script that executes the target groff binaries: point pdfmom at GROFFBIN,
### the cross groff of the toolchain (PKG_MAKEVARS), as groff 1.23 did through GROFF_BIN_PATH
sed -i 's/GROFF_COMMAND=test-groff/GROFF_COMMAND=$(GROFFBIN)/' Makefile.in

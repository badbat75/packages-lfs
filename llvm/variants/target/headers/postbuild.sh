# shellcheck shell=bash
# shellcheck disable=SC2154
# llvm, target headers: no cmake files are installed, so the postbuild of target/sysroot (sed on
# the installed cmake files) does not apply: this empty script replaces it

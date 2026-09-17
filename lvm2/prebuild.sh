# shellcheck shell=bash
# shellcheck disable=SC2154
# lvm2: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed 's@../../include/cmds.h@../include/cmds.h@' -i lib/commands/cmd_enum.h
### LVM_CONFIGURE_LINE, which lvm and liblvm2cmd carry and "lvm version" prints, is "$0 $@": $0 is the
### configure of the build directory, a path of the build host. The name alone says as much
sed '/^CONFIGURE_LINE=/ s@\$0@./configure@' -i configure.ac

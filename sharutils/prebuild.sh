# shellcheck shell=bash
# shellcheck disable=SC2154
# sharutils: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -i 's/BUFSIZ/rw_base_size/' src/unshar.c
    sed -i '/program_name/s/^/extern /' src/*opts.h
    sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
    echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h

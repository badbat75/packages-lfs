# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc: pre-build script of the sysroot glibc, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# The cross and stage1 targets carry their own script under variants/target/.

mkdir -pv ${PKG_BLDPATH}
cat <<-EOF > ${PKG_BLDPATH}/configparms
	rootsbindir=${INSTALL_EXECPREFIX}/sbin
	complocaledir=${INSTALL_LIBDIR}/locale
	datadir=${INSTALL_SHAREDIR}
EOF
### glibc compiles C with $(CFLAGS) $(CPPFLAGS), and a file that needs more than the platform gives
### adds its own -march to CFLAGS: the SVE functions of libmvec on aarch64, which run only on a CPU
### that has SVE. The -march of the platform, which configure records in CPPFLAGS-config as well,
### came after it and won ("ACLE function 'svdup_n_s64' requires ISA extension 'sve'"). The
### architecture stays in CFLAGS, and the assembler takes its -m options from there too (ASFLAGS)
cat <<-'EOF' >> ${PKG_BLDPATH}/configparms
	CPPFLAGS-config := $(filter-out -march=% -mcpu=% -mtune=%,$(CPPFLAGS-config))
EOF

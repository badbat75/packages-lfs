# shellcheck shell=bash
# shellcheck disable=SC2154
# SQLite, option tcl: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# The makefile sources tclConfig.sh and compiles with its TCL_INCLUDE_SPEC and TCL_STUB_LIB_SPEC,
# which carry the run time paths of the target (-I/usr/include would pull the host headers into
# the cross build): a copy with the paths bound to the sysroot ("=" prefix of gcc and ld).
# configure looks for the tclsh it needs in the bin directory of TCL_EXEC_PREFIX: the native one
# (--with-tclsh cannot name it, it makes configure take the tclConfig.sh of that tclsh instead)
mkdir -pv tclconfig
sed -e 's#-I/#-I=/#g' -e 's#-L/#-L=/#g' \
	-e "s#^TCL_EXEC_PREFIX=.*#TCL_EXEC_PREFIX='${GLOBAL_TOOLCHAIN_PATH}'#" \
	"${SYSROOT}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/tclConfig.sh" > tclconfig/tclConfig.sh

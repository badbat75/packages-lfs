# shellcheck shell=bash
# shellcheck disable=SC2154
# Tcl: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### tclPkgConfig.o (::tcl::pkgconfig) gets the install directories as $(INSTALL_ROOT)$(libdir)...,
### INSTALL_ROOT is $(DESTDIR) and the framework passes DESTDIR to every make run: libtcl8.6.so named
### the staging directory. The same directories without INSTALL_ROOT
# shellcheck disable=SC2016
sed -E -e '/-DCFG_INSTALL_/ {
	s/\$\(LIB_INSTALL_DIR\)/$(libdir)/
	s/\$\(BIN_INSTALL_DIR\)/$(bindir)/
	s/\$\(SCRIPT_INSTALL_DIR\)/$(TCL_LIBRARY)/
	s/\$\(INCLUDE_INSTALL_DIR\)/$(includedir)/
	s/\$\(MAN_INSTALL_DIR\)/$(mandir)/
}' -i unix/Makefile.in

# shellcheck shell=bash
# shellcheck disable=SC2154
# Tk: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### tkConfig.o (::tk::pkgconfig) gets the install directories as $(INSTALL_ROOT)$(libdir)...,
### INSTALL_ROOT is $(DESTDIR) and the framework passes DESTDIR to every make run: libtcl9tk9.1.so
### named the staging directory. The same directories without INSTALL_ROOT, as lfs/Tcl does; the
### run time demo directory (CFG_RUNTIME_DEMODIR) is the install one too
# shellcheck disable=SC2016
sed -E -e '/-DCFG_(INSTALL|RUNTIME)_/ {
	s/\$\(LIB_INSTALL_DIR\)/$(libdir)/
	s/\$\(BIN_INSTALL_DIR\)/$(bindir)/
	s/\$\(SCRIPT_INSTALL_DIR\)/$(TK_LIBRARY)/
	s/\$\(INCLUDE_INSTALL_DIR\)/$(includedir)/
	s/\$\(MAN_INSTALL_DIR\)/$(mandir)/
	s/\$\(DEMO_INSTALL_DIR\)/@DEMO_DIR@/
}' -i unix/Makefile.in

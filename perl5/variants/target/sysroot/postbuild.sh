# shellcheck shell=bash
# shellcheck disable=SC2154
# perl5, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Config.pm, Config_heavy.pl, config.h and xconfig.h give ExtUtils::MakeMaker the compiler, the
### programs and the flags of the build. toolchain_cc, toolchain_cpp and toolchain_ranlib (and the
### toolchain_build_ ones perl-cross runs on the build machine) are the toolchain wrapper running CC,
### CPP and RANLIB: in the image those programs
PERL_CORE=${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/core_perl
strip_host_paths "${PERL_CORE}"/{Config.pm,Config_heavy.pl,CORE/config.h,CORE/xconfig.h}
sed -E -e "s/\btoolchain_(build_)?cc\b/$(basename "${CC_EXE}")/g" \
	-e "s/\btoolchain_(build_)?(cpp|cxx)\b/$(basename "${CC_EXE}") -E/g" \
	-e "s/\btoolchain_(build_)?ranlib\b/$(basename "${RANLIB}")/g" \
	-i "${PERL_CORE}"/{Config.pm,Config_heavy.pl,CORE/config.h,CORE/xconfig.h}

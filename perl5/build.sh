# shellcheck shell=bash
# shellcheck disable=SC2154
# perl5: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

	[ -d ${SRC_PATH}/perl ] && cp -frpv ${SRC_PATH}/perl/* . || true
	${PKG_SRCPATH}/configure \
		--prefix=/usr --target=${HARCH} --sysroot=${BIN_PATH} \
		--host-cc=${TOOLCHAIN_PATH}/bin/toolchain_build_cc \
		--host-cpp=${TOOLCHAIN_PATH}/bin/toolchain_build_cxx \
		--host-ranlib=${TOOLCHAIN_PATH}/bin/toolchain_build_ranlib \
		--with-cc=${TOOLCHAIN_PATH}/bin/toolchain_cc \
		--with-cpp=${TOOLCHAIN_PATH}/bin/toolchain_cpp \
		--with-ranlib=${TOOLCHAIN_PATH}/bin/toolchain_ranlib \
		-Dccflags="${PLATFORM_CFLAGS} -Wno-attributes"\ \
		-Doptimize="${OPTCOMP_FLAGS}" \
		-Dldflags="${OPTLINK_FLAGS}" \
		-Dpager='${INSTALL_PREFIX}/bin/less -isR' \
		-Duseshrplib \
		-Dusethreads \
		-Dmyhostname=localhost \
		-Dperladmin=root@localhost \
        -Dprivlib=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/core_perl      \
        -Darchlib=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/core_perl      \
        -Dsitelib=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/site_perl      \
        -Dsitearch=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/site_perl     \
        -Dvendorlib=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/vendor_perl  \
        -Dvendorarch=${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/perl5/${PKG_PERL_LIBVER}/vendor_perl
	make ${PKG_MAKEVARS} V=${MAKEVERBOSE:-0} crosspatch miniperl dynaloader perl cflags nonxs_ext utilities
	make ${PKG_MAKEVARS} V=${MAKEVERBOSE:-0} -j1 extensions pods
	make ${PKG_MAKEVARS} V=${MAKEVERBOSE:-0} DESTDIR=${PKG_PKGPATH} install

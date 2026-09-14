# shellcheck shell=bash
# shellcheck disable=SC2154
# boost: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

./bootstrap.sh \
		--prefix="${PKG_PKGPATH}${INSTALL_PREFIX}" \
		--exec-prefix="${PKG_PKGPATH}${INSTALL_EXECPREFIX}" \
		--libdir="${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}" \
		--includedir="${PKG_PKGPATH}${INSTALL_INCLUDEDIR}" \
		--with-icu \
		--with-python-version=${PYTHONBIN_VER} \
		--with-toolset=${BBTC}
	sed -i "s|using ${BBTC} ;|using ${BBTC} : : ${CC} ;|" project-config.jam
	./b2 -q -j${NPROCS} $(
			if [ "${MAKEVERBOSE:-0}" -eq 1 ]
			then
				echo -n "-d+2"
			else
				echo -n "-d+1"
			fi
		) \
		$(
			case ${HM} in
				arm|aarch64)	echo -n "architecture=arm abi=aapcs" ;;
				x86|x86_64)		echo -n "architecture=x86 abi=sysv" ;;
				*)				trow_error "${ERROR_GENERIC}" "Missing architecture mapping for ${HM}" ;;
			esac
		) \
		address-model=${HARCH_BITWIDTH} \
		$(
			case ${HOS} in
				linux|android)  echo -n "binary-format=elf" ;;
				windows)        echo -n "binary-format=pe" ;;
				macosx|ios)     echo -n "binary-format=mach-o" ;;
			esac
		) \
		target-os=${HOS} \
		variant=release \
		$(
			case ${OPTLEVEL} in
				2)	echo -n "optimization=minimal" ;;
				3)	echo -n "optimization=speed" ;;
				s)	echo -n "optimization=space" ;;
				*)	echo -n "optimization=off" ;;
			esac
		) \
		threading=multi \
		toolset=${BBTC} \
		pch=off \
		cflags="${CFLAGS}" \
		cxxflags="${CXXFLAGS}" \
		linkflags="${LDFLAGS}" \
		install

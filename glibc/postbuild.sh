# shellcheck shell=bash
# shellcheck disable=SC2154
# glibc: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

case ${PKG_TARGET} in
	cross)
		ln -sfv ${INSTALL_PREFIX}/glibc${GLIBC_VER}/bin/localedef ${INSTALL_PREFIX}/bin
		install -vdm755 ${INSTALL_PREFIX}/glibc${GLIBC_VER}/lib/locale
		patchelf --remove-rpath ${INSTALL_PREFIX}/glibc${GLIBC_VER}/lib/ld-linux*.so.*
	;;
	stage1)
		mkdir -pv ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
		install csu/crt1.o csu/crti.o csu/crtn.o ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}
		${CC} ${CFLAGS} ${LDFLAGS} -nostdlib -nostartfiles -shared -x c /dev/null -o ${PKG_PKGPATH}${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/libc.so
	;;
	stage2) ;;
	*)
		if [ -n "${INSTALL_LIBSUFFIX}" ]
		then
			install -vdm755 ${PKG_PKGPATH}/lib
			LD_LINUX_NAME=$(basename elf/ld-linux-*.so.*)
			ln -sfv "${INSTALL_LIBSUFFIX#/}/${LD_LINUX_NAME}" "${PKG_PKGPATH}/lib"
		fi
		install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/ld.so.conf.d

		cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/nsswitch.conf <<-EOF
			# Begin /etc/nsswitch.conf

			passwd: files
			group: files
			shadow: files

			hosts: files dns
			networks: files

			protocols: files
			services: files
			ethers: files
			rpc: files

			# End /etc/nsswitch.conf
		EOF

		cat > ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/ld.so.conf <<-EOF
			# Begin /etc/ld.so.conf
			# Add an include directory

			include /etc/ld.so.conf.d/*.conf

			# End /etc/ld.so.conf
		EOF

		install -vdm755 ${PKG_PKGPATH}${INSTALL_LIBDIR}/locale
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ${I18N_C_VAR:-C} -f UTF-8 C.UTF-8 || true
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i cs_CZ -f UTF-8 cs_CZ.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i de_DE -f ISO-8859-1 de_DE
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i de_DE@euro -f ISO-8859-15 de_DE@euro
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i de_DE -f UTF-8 de_DE.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i el_GR -f ISO-8859-7 el_GR
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i en_GB -f ISO-8859-1 en_GB
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i en_GB -f UTF-8 en_GB.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i en_HK -f ISO-8859-1 en_HK
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i en_PH -f ISO-8859-1 en_PH
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i en_US -f ISO-8859-1 en_US
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i en_US -f UTF-8 en_US.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i es_ES -f ISO-8859-15 es_ES@euro
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i es_MX -f ISO-8859-1 es_MX
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i fa_IR -f UTF-8 fa_IR
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i fr_FR -f ISO-8859-1 fr_FR
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i fr_FR@euro -f ISO-8859-15 fr_FR@euro
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i fr_FR -f UTF-8 fr_FR.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i is_IS -f ISO-8859-1 is_IS
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i is_IS -f UTF-8 is_IS.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i it_IT -f ISO-8859-1 it_IT
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i it_IT -f ISO-8859-15 it_IT@euro
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i it_IT -f UTF-8 it_IT.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ja_JP -f EUC-JP ja_JP
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ja_JP -f SHIFT_JIS ja_JP.SJIS --no-warnings=ascii
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ja_JP -f UTF-8 ja_JP.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i nl_NL@euro -f ISO-8859-15 nl_NL@euro
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ru_RU -f KOI8-R ru_RU.KOI8-R
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ru_RU -f UTF-8 ru_RU.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i se_NO -f UTF-8 se_NO.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i ta_IN -f UTF-8 ta_IN.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i tr_TR -f UTF-8 tr_TR.UTF-8
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i zh_CN -f GB18030 zh_CN.GB18030
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i zh_HK -f BIG5-HKSCS zh_HK.BIG5-HKSCS
		I18NPATH=${PKG_PKGPATH}/usr/share/i18n localedef --prefix=${PKG_PKGPATH} -i zh_TW -f UTF-8 zh_TW.UTF-8

		if [ ${LFS_ENABLENSCD:-0} -eq 1 ]
		then
			cp -fv ${PKG_SRCPATH}/nscd/nscd.conf ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/nscd.conf
			install -vdm755 ${PKG_PKGPATH}/var/cache/nscd
			install -vDm644 ${PKG_SRCPATH}/nscd/nscd.tmpfiles ${PKG_PKGPATH}${INSTALL_LIBDIR}/tmpfiles.d/nscd.conf
			install -vDm644 ${PKG_SRCPATH}/nscd/nscd.service ${PKG_PKGPATH}/lib/systemd/system/nscd.service
			# The post install step is decided here, at build time: it only exists with nscd enabled
			install -vdm755 ${PKG_PKGPATH}/postinst_scripts
			echo "systemctl disable nscd" > ${PKG_PKGPATH}/postinst_scripts/01_${PKG_FULLNAME}
		fi
	;;
esac
if [ ! -f ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gnu/stubs.h ]
then
	install -vDm644 /dev/null ${PKG_PKGPATH}${INSTALL_INCLUDEDIR}/gnu/stubs.h
fi

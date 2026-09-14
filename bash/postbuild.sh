# shellcheck shell=bash
# shellcheck disable=SC2154
# bash: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.
# The system-wide shell startup files (Beyond Linux From Scratch) live in files/.

mkdir -pv ${PKG_PKGPATH}${INSTALL_SYSCONFDIR} ${PKG_PKGPATH}/root
ln -sfv bash ${PKG_PKGPATH}${INSTALL_PREFIX}/bin/sh

install -v -m644 ${PKG_RECIPEPATH}/files/profile.sh ${PKG_PKGPATH}/etc/profile
install -v -m644 ${PKG_RECIPEPATH}/files/bashrc.sh ${PKG_PKGPATH}/etc/bashrc
install -v -d -m755 ${PKG_PKGPATH}/etc/profile.d
for PROFILE_SCRIPT in bash_completion dircolors extrapaths umask i18n
do
	install -v -m644 ${PKG_RECIPEPATH}/files/profile.d/${PROFILE_SCRIPT}.sh ${PKG_PKGPATH}/etc/profile.d/${PROFILE_SCRIPT}.sh
done

install -v -d -m755 ${PKG_PKGPATH}/etc/skel
install -v -m644 ${PKG_RECIPEPATH}/files/skel/bash_profile.sh ${PKG_PKGPATH}/etc/skel/.bash_profile
install -v -m644 ${PKG_RECIPEPATH}/files/skel/bashrc.sh ${PKG_PKGPATH}/etc/skel/.bashrc
install -v -m644 ${PKG_RECIPEPATH}/files/skel/bash_logout.sh ${PKG_PKGPATH}/etc/skel/.bash_logout
find ${PKG_PKGPATH}/etc/skel/ -type f -exec cp -fv {} ${PKG_PKGPATH}/root \;

if [ ${LFS_SPLITUSR:-0} -eq 1 ]
then
	mkdir -pv ${PKG_PKGPATH}/bin
	ln -s ../usr/bin/{bash,sh} ${PKG_PKGPATH}/bin
fi

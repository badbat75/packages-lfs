# shellcheck shell=bash
# shellcheck disable=SC2154
# xorg-server: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

install -vdm755 ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/{X11/xorg.conf.d,profile.d}
	echo "export VDPAU_DRIVER=va_gl" >> ${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/profile.d/xorg.sh

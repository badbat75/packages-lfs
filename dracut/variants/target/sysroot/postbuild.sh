# shellcheck shell=bash
# shellcheck disable=SC2154
# dracut, target sysroot: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

# dracut-ng stamps the version into the dracut script itself (DRACUT_VERSION="112"), there is no
# dracut-version.sh any more: mark the build as ours inside the quotes
sed "/^DRACUT_VERSION=/ s/\"\$/-lfs\"/" -i ${PKG_PKGPATH}${INSTALL_EXECPREFIX}/bin/dracut

### A board without a real time clock starts the initramfs at the release date of systemd, its
### built-in floor: the first lines of the journal of every boot had that date. clock-epoch raises
### the floor: this package installs the file, so it is in the sysroot when kernelbuild makes the
### initramfs there, before any post install script (reproducible="yes" of 01-dist.conf gives it
### the mtime of dracut-functions.sh, the time this package was built); the systemd postinstall
### touches it inside the image, the floor of the root file system
install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/dracut/dracut.conf.d
echo "install_optional_items+=\" ${INSTALL_PREFIX}/lib/clock-epoch \"" \
	> ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/dracut/dracut.conf.d/50-clock-epoch.conf
touch ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/clock-epoch

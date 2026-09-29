# shellcheck shell=bash
# shellcheck disable=SC2154
# kernel: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, the kernel tree, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The initramfs is part of the package (PKG_KERNEL_INITRAMFS=1), made by the dracut of the sysroot on
### the build host (dracut-sysroot of lfs/dracut:native). dracut takes the kernel modules from the
### sysroot, so the ones of this build go there first (the package installs them there anyway).
### No graphics driver (no drm module of dracut): the screen of the boot is simpledrm, built in on
### the framebuffer the UEFI firmware or GRUB leaves, and udev loads the driver of the card from the
### root file system with its firmware. With them the generic initramfs took every drm module of the
### kernel with every firmware file they name (nouveau alone: 280 MB), when linux-firmware was
### already in the sysroot, and none when it was not; a machine gets its own initramfs from
### dracut-hostonly.service of lfs/dracut
if [ "${PKG_KERNEL_INITRAMFS:-0}" -eq 1 ]
then
	KERNEL_RELEASE=$(cat include/config/kernel.release)
	mkdir -pv "${BIN_PATH}/lib/modules/${KERNEL_RELEASE}"
	rsync -a --delete "${PKG_PKGPATH}/lib/modules/${KERNEL_RELEASE}/" "${BIN_PATH}/lib/modules/${KERNEL_RELEASE}/"
	DRACUT_ARCH=${HM} "${GLOBAL_TOOLCHAIN_PATH}/bin/dracut-sysroot" "${BIN_PATH}" "${KERNEL_RELEASE}" \
		"${PKG_PKGPATH}/boot/initramfs-${KERNEL_RELEASE}.img" --tmpdir "${PKG_BLDPATH}" \
		-N --fstab --zstd --filesystems "${PKG_KERNEL_INITRAMFS_DRIVERS:-ext4}"
	### The post install script that made it inside the image, left in the sysroot by earlier builds
	rm -fv "${BIN_PATH}/postinst_scripts/99_kernel"
fi

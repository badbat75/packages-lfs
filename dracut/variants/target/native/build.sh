# shellcheck shell=bash
# shellcheck disable=SC2154
# dracut, target native: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

./configure --prefix=${INSTALL_PREFIX}
make V=1 src/install/dracut-install
install -vDm755 src/install/dracut-install ${INSTALL_EXECPREFIX}/bin/dracut-install
echo ${PKG_VER} > ${INSTALL_SHAREDIR}/dracut-install.version

### dracut-sysroot <sysroot> <kernel release> <image> [<dracut options>...]: the dracut of <sysroot>
### (lfs/dracut) run by the bash of the build host, the initramfs of the image made without emulation
### (the postbuild.sh of the kernel recipes). Its modules and the files they install come from the
### sysroot, and so do the kernel modules (the kernel recipe puts its own there first); the programs it
### runs on the host are the ones of the global toolchain, the dependencies of this build:
### dracut-install, which resolves the libraries of the target binaries reading their ELF headers,
### systemctl --root, depmod, cpio and zstd (the first of PATH). ldconfig -r chroots into the tree of
### the initramfs: the static ldconfig of the target, as the root of a user namespace (the one of the
### host skips every library of another architecture). DRACUT_ARCH, the machine of the target, comes
### from the environment
cat > ${INSTALL_EXECPREFIX}/bin/dracut-sysroot <<-SCRIPT
	#!/bin/sh
	# dracut-sysroot <sysroot> <kernel release> <image> [<dracut options>...] (lfs/dracut:native)
	SYSROOT=\${1}
	KERNEL_RELEASE=\${2}
	IMAGE=\${3}
	shift 3
	PATH="${INSTALL_EXECPREFIX}/bin:\${PATH}" \\
	SYSTEMCTL="${INSTALL_EXECPREFIX}/bin/systemctl" \\
	DRACUT_COMPRESS_ZSTD="${INSTALL_EXECPREFIX}/bin/zstd" \\
	DRACUT_INSTALL="${INSTALL_EXECPREFIX}/bin/dracut-install" \\
	DRACUT_LDCONFIG="unshare -r \${SYSROOT}/usr/sbin/ldconfig" \\
	exec bash "\${SYSROOT}/usr/bin/dracut" --sysroot "\${SYSROOT}" --force --kver "\${KERNEL_RELEASE}" "\${@}" "\${IMAGE}"
SCRIPT
chmod 755 ${INSTALL_EXECPREFIX}/bin/dracut-sysroot

# bs_kernel
PKG_VER=${KERNEL_VER}
PKG_URL="https://cdn.kernel.org/pub/linux/kernel/v$( echo ${PKG_VER} | cut -d'.' -f1 ).x/linux-${PKG_VER}.tar.xz"
PKG_DEPS="lfs/bison:native lfs/flex:native"
case ${PKG_TARGET} in
	headers) PKG_TOOLCHAIN=gnu ;;
	*) PKG_DEPS+=" lfs/elfutils:cross lfs/dracut" ;;
esac
BUILD_PROCESS=kernelbuild
PKG_MAKEVARS="INSTALL_MOD_STRIP=1"
CONF_FLAGS="-d WERROR"
CONF_FLAGS+=" -d DEBUG_INFO_BTF"
### To enable systemd oom support
CONF_FLAGS+=" -e MEMCG -e PSI"
### To enable systemd iptables support
CONF_FLAGS+=" -e BPF_SYSCALL -e CGROUP_BPF"
### To enable BFQ scheduler
CONF_FLAGS+=" -m IOSCHED_BFQ"
### To enable needed Filesystems
PKG_KERNEL_INITRAMFS=${WITH_INITRAMFS:-0}
case ${PKG_KERNEL_INITRAMFS} in
	1)
		PKG_DEPS+=" lfs/dracut"
		PKG_KERNEL_INITRAMFS_DRIVERS="${WITH_KERNEL_FS}"
		for filesystem in ${PKG_KERNEL_INITRAMFS_DRIVERS}
		do
			case ${filesystem} in
				ext4)  CONF_FLAGS+=" -m EXT4_FS -e EXT4_USE_FOR_EXT2 -e EXT4_FS_POSIX_ACL -e EXT4_FS_SECURITY" ;;
				xfs)   CONF_FLAGS+=" -m XFS_FS -e XFS_QUOTA -e XFS_POSIX_ACL -e XFS_RT" ;;
				btrfs) CONF_FLAGS+=" -m BTRFS_FS -e BTRFS_FS_POSIX_ACL" ;;
				f2fs)  CONF_FLAGS+=" -m F2FS_FS -e F2FS_CHECK_FS -e F2FS_FAULT_INJECTION -e F2FS_FS_SECURITY -e F2FS_FS_COMPRESSION" ;;
			esac
		done
	;;
	0)
		PKG_KERNEL_INITRAMFS_DRIVERS="${WITH_KERNEL_FS}"
		for filesystem in ${PKG_KERNEL_INITRAMFS_DRIVERS}
		do
			case ${filesystem} in
				ext4)  CONF_FLAGS+=" -e EXT4_FS -e EXT4_USE_FOR_EXT2 -e EXT4_FS_POSIX_ACL -e EXT4_FS_SECURITY" ;;
				xfs)   CONF_FLAGS+=" -e XFS_FS -e XFS_QUOTA -e XFS_POSIX_ACL -e XFS_RT" ;;
				btrfs) CONF_FLAGS+=" -e BTRFS_FS -e BTRFS_FS_POSIX_ACL" ;;
				f2fs)  CONF_FLAGS+=" -e F2FS_FS -e F2FS_CHECK_FS -e F2FS_FAULT_INJECTION -e F2FS_FS_SECURITY -e F2FS_FS_COMPRESSION" ;;
			esac
		done
	;;
esac

case ${WITH_RT:-0} in
	yes|1)
	# Enable preemptive/realtime kernel
		CONF_FLAGS+=" -d PREEMPT_NONE -d PREEMPT_VOLUNTARY -e PREEMPT"
	;;
esac

case ${PLATFORM_NAME} in
	generic-*)
		CONF_FLAGS+=" -m VIRTIO_MEM -m CONFIG_VIRTIO_BALLOON -m CONFIG_VIRTIO_MMIO -m VIRTIO_PCI"
		CONF_FLAGS+=" -m DRM -m DRM_VIRTIO_GPU -m FB -e DRM_FBDEV_EMULATION"
		CONF_FLAGS+=" -m VIRTIO_INPUT -m HW_RANDOM_VIRTIO -m SND_VIRTIO -m VIRTIO_FS"
		#CONF_FLAGS+=" -d DRM_NOUVEAU -d DRM_ROCKCHIP -d DRM_SUN4I -d DRM_MSM -d DRM_TEGRA"
		PKG_KERNEL_INITRAMFS_DRIVERS="virtio_input"
	;;
esac

PKG_KERNEL_INITRAMFS=1
case ${TOOLCHAIN} in
	gnu) PKG_OVERRIDELD=bfd;;
	llvm) PKG_MAKEVARS=LLVM_IAS=0;;
esac

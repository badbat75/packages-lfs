# dracut
PKG_VER=059
PKG_URL="https://github.com/dracutdevs/dracut/archive/refs/tags/${PKG_VER}.tar.gz"
PKG_DEPS="lfs/systemd lfs/kmod lfs/cpio lfs/bash lfs/gzip lfs/bzip2 lfs/xz lfs/lz4 lfs/zstd lfs/coreutils lfs/util-linux lfs/sed"
PKG_COPYSRC=1
BUILD_PROCESS=custom
PKG_LDFLAGS="-s"
PKG_PREBUILD=""
PKG_BUILDSCRIPT="./configure \\
	--systemdsystemunitdir=/lib/systemd/system \\
	--enable-dracut-cpio
	sed -e 's/cargo --offline build --release/cargo --offline build --target=${HM}-unknown-${HOS}-${HLIBC} --release/' \
		-e 's@src/dracut-cpio/target/release/dracut-cpio@src/dracut-cpio/target/${HM}-unknown-${HOS}-${HLIBC}/release/dracut-cpio@g' -i Makefile
"
case ${TOOLCHAIN} in
	llvm) PKG_BUILDSCRIPT+="RUSTFLAGS=\"-C linker=clang -C link-arg=--sysroot=\${SYSROOT} -C link-arg=--target=${HARCH} -C link-arg=-fuse-ld=lld\"" ;;
	gnu) PKG_BUILDSCRIPT+="RUSTFLAGS=\"-C linker=${HARCH}-gcc -C link-arg=--sysroot=\${SYSROOT} -C link-arg=-fuse-ld=gold\"" ;;
esac
PKG_BUILDSCRIPT+="
	export RUSTFLAGS
	make V=1 DESTDIR=\${PKG_PKGPATH} install"

PKG_POSTBUILD="sed '/^DRACUT_VERSION=/ s/$/${PKG_VER}-lfs/' -i \${PKG_PKGPATH}/usr/lib/dracut/dracut-version.sh"
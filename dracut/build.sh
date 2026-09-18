# shellcheck shell=bash
# shellcheck disable=SC2154
# dracut: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}[/${CONF_PATH}], bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The Makefile links the units into modules.d with ln -sr between the staging paths: under
### /lib/systemd/system the relative path is one level short once /lib is the link to usr/lib of the
### image, and every dracut unit (dracut-shutdown, the initrd ones) pointed to /usr/usr/lib/dracut
./configure \
	--systemdsystemunitdir=${INSTALL_PREFIX}/lib/systemd/system \
	--enable-dracut-cpio
sed -e "s/cargo --offline build --release/cargo --offline build --target=${HM}-unknown-${HOS}-${HLIBC} --release/" \
	-e "s@src/dracut-cpio/target/release/dracut-cpio@src/dracut-cpio/target/${HM}-unknown-${HOS}-${HLIBC}/release/dracut-cpio@g" -i Makefile
case ${TOOLCHAIN} in
	llvm) RUSTFLAGS="-C linker=clang -C link-arg=--sysroot=${SYSROOT} -C link-arg=--target=${HARCH} -C link-arg=-fuse-ld=lld" ;;
	gnu) RUSTFLAGS="-C linker=${HARCH}-gcc -C link-arg=--sysroot=${SYSROOT} -C link-arg=-fuse-ld=bfd" ;;
esac
export RUSTFLAGS
make V=1 DESTDIR=${PKG_PKGPATH} install

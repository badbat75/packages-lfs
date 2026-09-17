# shellcheck shell=bash
# shellcheck disable=SC2154
# Mesa: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

sed -e '/#include <sstream>/a #include <limits>' -i src/gallium/drivers/r600/sfn/sfn_valuefactory.cpp

### The Rust of rusticl: meson passes the --target of the rust command to bindgen, whose clang also
### needs the headers of the sysroot. Without rust_ld meson links through the C compiler command,
### which starts with the sccache wrapper (-C linker=sccache): the compiler alone is the last word of CC.
### meson does not read RUSTFLAGS, the rustc flags of the framework (link arguments: sysroot, target and
### linker for clang; target cpu): they go into the rust command itself, the only thing the sanity check
### of meson runs (rust_args are left out of it), without the final -C linker= that rust_ld replaces
RUST_CMD="'${GLOBAL_TOOLCHAIN_PATH}/bin/rustc', '--target', '${CARGO_TARGET}'"
for RUST_ARG in ${RUSTFLAGS% -C linker=*}
do
	RUST_CMD+=", '${RUST_ARG}'"
done
cat > bbxb-rust.ini <<-EOF
	[binaries]
	rust = [${RUST_CMD}]
	rust_ld = '${CC##* }'

	[properties]
	bindgen_clang_arguments = ['--sysroot=${SYSROOT}']
EOF

# shellcheck shell=bash
# shellcheck disable=SC2154
# glycin: pre-build script, sourced by runprebuild.sh (cwd: ${PKG_SRCPATH}, set -x, no -e).

### The meson project declares the rust language, whose compiler a cross build takes from the cross file,
### and hands the rust_target property to cargo: a second cross file next to the one of mesonninja.
### Without rust_ld the sanity check of meson links through the first word of the C compiler, the
### compiler wrapper: rust_ld is the compiler with its arguments (the llvm target and sysroot). cargo
### builds with RUSTFLAGS
RUST_LD="'${CC_EXE}'"
for RUST_LD_ARG in ${CC#*"${CC_EXE}"}
do
	RUST_LD+=", '${RUST_LD_ARG}'"
done
cat > "${PKG_BLDPATH}/cross-rust" <<-EOF
	[binaries]
	rust = ['rustc', '--target', '${CARGO_TARGET}']
	rust_ld = [${RUST_LD}]

	[properties]
	rust_target = '${CARGO_TARGET}'
EOF

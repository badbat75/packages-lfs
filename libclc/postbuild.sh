# shellcheck shell=bash
# shellcheck disable=SC2154
# libclc: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).

if [ ! -f "${PKG_SRCPATH}/libclc/CMakeLists.txt" ]
then
	echo "${PKG_SRCPATH}/libclc not found: the sources of lfs/llvm are gone, rebuild it with build --force" >&2
	exit 1
fi

### Nothing here is compiled for the target: the compiler is the native clang, away from the cross
### flags of environment.source. The cmake compiler checks are not linked (no libstdc++ needed on the host)
unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
LLVM_NATIVE_PATH="${GLOBAL_TOOLCHAIN_PATH}/llvm-${LLVM_VER}"
### llvm-spirv of the cross translator links the native libLLVM
export LD_LIBRARY_PATH="${LLVM_NATIVE_PATH}/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

### One build for each triple. The mesa3d vendor is gone from LLVM 23 (clang: "unknown target
### triple"); Mesa still looks for the files under the names of that vendor, and the mesa3d builds
### of the older libclc were the plain SPIR-V ones
for CLC_BITS in 32 64
do
	CLC_TRIPLE="spirv${CLC_BITS}-unknown-unknown"
	"${GLOBAL_TOOLCHAIN_PATH}/bin/cmake" -S "${PKG_SRCPATH}/libclc" -B "${PKG_BLDPATH}/${CLC_TRIPLE}" -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_MAKE_PROGRAM="${GLOBAL_TOOLCHAIN_PATH}/bin/ninja" \
		-DCMAKE_C_COMPILER="${LLVM_NATIVE_PATH}/bin/clang" \
		-DCMAKE_CXX_COMPILER="${LLVM_NATIVE_PATH}/bin/clang++" \
		-DCMAKE_TRY_COMPILE_TARGET_TYPE=STATIC_LIBRARY \
		-DLLVM_DIR="${LLVM_NATIVE_PATH}/lib/cmake/llvm" \
		-DLLVM_DEFAULT_TARGET_TRIPLE="${CLC_TRIPLE}" \
		-DLLVM_SPIRV="${TOOLCHAIN_PATH}/bin/llvm-spirv" \
		-DCMAKE_INSTALL_PREFIX="${INSTALL_PREFIX}"
	"${GLOBAL_TOOLCHAIN_PATH}/bin/ninja" -C "${PKG_BLDPATH}/${CLC_TRIPLE}" -j"${NPROCS}"
	case ${CLC_BITS} in
		32) CLC_MESANAME="spirv-mesa3d-.spv" ;;
		64) CLC_MESANAME="spirv64-mesa3d-.spv" ;;
	esac
	install -vDm644 "${PKG_BLDPATH}/${CLC_TRIPLE}/${CLC_TRIPLE}/libclc.spv" "${PKG_PKGPATH}${INSTALL_SHAREDIR}/clc/${CLC_MESANAME}"
done

### LLVM 23 no longer writes libclc.pc; Mesa reads libexecdir from it
install -vd "${PKG_PKGPATH}${INSTALL_SHAREDIR}/pkgconfig"
cat > "${PKG_PKGPATH}${INSTALL_SHAREDIR}/pkgconfig/libclc.pc" <<-EOF
	libexecdir=${INSTALL_SHAREDIR}/clc

	Name: libclc
	Description: Library requirements of the OpenCL C programming language
	Version: ${PKG_VER}
	Libs:
	Cflags:
EOF

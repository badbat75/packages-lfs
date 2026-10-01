# shellcheck shell=bash
# shellcheck disable=SC2154
# python3, target crossenv: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Replaces the postbuild.sh of target/sysroot. Every ALL_CAPS variable visible to package.env is available
# here as ${VAR}.

VENV=${TOOLCHAIN_PATH}/venv-${HARCH}
### The root of the python of the image: the sysroot, or the image of a distribution
PYTHON_ROOT=${PYTHON_FOR_TARGET%/usr/bin/*}
if [ ! -x "${PYTHON_FOR_TARGET}" ]
then
	echo "${PYTHON_FOR_TARGET} not found: build lfs/python3 first" >&2
	exit 1
fi
rm -rf "${VENV}"
"${PYTHON_FOR_BUILD}" -m crossenv "${PYTHON_FOR_TARGET}" "${VENV}"
### The headers and python3-config of the image
rmdir -v "${VENV}/cross/include"
ln -sfv "${PYTHON_ROOT}${TARGET_INCLUDEDIR}" "${VENV}/cross/include"
cat > "${VENV}/cross/bin/python3-config" <<-EOF
	#!/bin/sh
	${PYTHON_ROOT}${TARGET_PREFIX}/bin/python3-config \${@}
EOF
chmod +x "${VENV}/cross/bin/python3-config"
(
	# shellcheck source=/dev/null
	source "${VENV}/bin/activate"
	### setuptools stays current: crossenv keeps build-python's site-packages ahead of pip's isolated
	### build environments, so an old setuptools here would validate every sdist metadata (PEP 639
	### licence strings need setuptools >= 77)
	build-python -m pip install --upgrade cython setuptools wheel
	### cython for the target with the compilers of this build (environment.source)
	PIP_CACHE_DIR="${DOWNLOAD_PATH}/pip" cross-pip -v install --upgrade setuptools cython Mako
	PIP_CACHE_DIR="${DOWNLOAD_PATH}/pip" build-pip -v install --upgrade setuptools jinja2
)
sed -i "1 a PYTHONPATH=\"\${SYSROOT}/usr/lib/python${PYTHONBIN_VER}/site-packages\"" "${VENV}/bin/cross-python3"

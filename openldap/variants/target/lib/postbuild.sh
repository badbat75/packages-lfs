# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap:lib: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### Only the files of OPENLDAP_LIB_FILES stay (read as patterns, not expanded on the build host)
read -r -a FILES <<< "${OPENLDAP_LIB_FILES}"
KEEP=()
for FILE in "${FILES[@]}"
do
	KEEP+=( ! -path "${PKG_PKGPATH}${FILE}" )
done
find "${PKG_PKGPATH}" ! -type d "${KEEP[@]}" -exec rm -fv {} +
find "${PKG_PKGPATH}" -mindepth 1 -type d -empty -delete

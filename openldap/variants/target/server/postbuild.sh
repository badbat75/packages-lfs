# shellcheck shell=bash
# shellcheck disable=SC2154
# openldap:server: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### What lfs/openldap:lib and lfs/openldap:client install goes (the lists read as patterns, not
### expanded on the build host)
read -r -a FILES <<< "${OPENLDAP_LIB_FILES} ${OPENLDAP_CLIENT_FILES}"
DROP=( -false )
for FILE in "${FILES[@]}"
do
	DROP+=( -o -path "${PKG_PKGPATH}${FILE}" )
done
find "${PKG_PKGPATH}" ! -type d \( "${DROP[@]}" \) -exec rm -fv {} +
find "${PKG_PKGPATH}" -mindepth 1 -type d -empty -delete

# shellcheck shell=bash
# shellcheck disable=SC2154
# ca-bundle: custom build script, sourced by runmake.sh (cwd: ${PKG_BLDPATH}, bash -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### The file downloaded is the one of the checksum of the recipe
echo "${CA_BUNDLE_SHA256}  ${PKG_SRCPATH}/cacert-${PKG_VER}.pem" | sha256sum -c
install -v -D -m 644 "${PKG_SRCPATH}/cacert-${PKG_VER}.pem" "${PKG_PKGPATH}${INSTALL_SYSCONFDIR}/ssl/cert.pem"

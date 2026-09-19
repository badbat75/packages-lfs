# shellcheck shell=bash
# shellcheck disable=SC2154
# Avahi: post-build script, sourced by runpostbuild.sh (cwd: ${PKG_BLDPATH}, set -ex).
# Every ALL_CAPS variable visible to package.env is available here as ${VAR}.

### preset-all in the systemd postinstall enables every unit no preset names. avahi-dnsconfd
### rewrites the DNS servers from what mDNS announces, and systemd-resolved already manages them:
### it logged "read(): EOF" at every shutdown
install -vdm755 ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/system-preset
echo "disable avahi-dnsconfd.service" > ${PKG_PKGPATH}${INSTALL_PREFIX}/lib/systemd/system-preset/80-avahi.preset

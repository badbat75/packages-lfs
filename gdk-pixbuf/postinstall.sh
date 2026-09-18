# shellcheck shell=bash
# shellcheck disable=SC2154
# gdk-pixbuf: post-install script, sourced as root inside the target chroot.

### A cross build neither generates nor installs loaders.cache. The glycin loader is built into the
### library; the cache lists the loader modules other packages install. The scripts run once every package
### is in the image. With no loader module installed its directory does not exist, and the cache file
### next to it could not be created
install -v -d -m755 ${INSTALL_LIBDIR}${INSTALL_LIBSUFFIX}/gdk-pixbuf-2.0/2.10.0/loaders
gdk-pixbuf-query-loaders --update-cache

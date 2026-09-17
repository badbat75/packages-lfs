# shellcheck shell=bash
# shellcheck disable=SC2154
# gdk-pixbuf: post-install script, sourced as root inside the target chroot.

### A cross build neither generates nor installs loaders.cache. The glycin loader is built into the
### library; the cache lists the loader modules other packages install. The scripts run once every package
### is in the image
gdk-pixbuf-query-loaders --update-cache

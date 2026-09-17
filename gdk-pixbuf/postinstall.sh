# shellcheck shell=bash
# shellcheck disable=SC2154
# gdk-pixbuf: post-install script, sourced as root inside the target chroot.

### A cross build neither generates nor installs loaders.cache, without which only the builtin loaders
### (png, jpeg) work. The scripts run once every package is in the image, so the cache also lists the
### loaders other packages install (the SVG one of lfs/librsvg)
gdk-pixbuf-query-loaders --update-cache

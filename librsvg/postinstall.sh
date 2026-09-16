# shellcheck shell=bash
# shellcheck disable=SC2154
# librsvg: post-install script, sourced as root inside the target chroot.
### The meson install cannot run the target gdk-pixbuf-query-loaders in a cross build: register
### the SVG loader in the gdk-pixbuf loaders cache here
gdk-pixbuf-query-loaders --update-cache

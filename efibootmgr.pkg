# efibootmgr
PKG_VER=18
PKG_URL="https://github.com/rhboot/efibootmgr/archive/${PKG_VER}/efibootmgr-${PKG_VER}.tar.gz"
PKG_DEPS="lfs/efivar lfs/popt"
BUILD_PROCESS=simplemake
PKG_MAKETARGETS=",install"
PKG_MAKEVARS="EFIDIR=LFS"
case ${HM} in
    x86_64) PKG_MAKEVARS+=" EFI_LOADER=grubx64.efi" ;;
esac
PKG_LDFLAGS="-s"

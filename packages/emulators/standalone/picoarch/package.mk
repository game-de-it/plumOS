# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="picoarch"
PKG_VERSION="10a5cf3202a041055a07fa34a75d084da234fc39"
PKG_SITE="https://github.com/game-de-it/picoarch_plumOS"
PKG_URL="${PKG_SITE}.git"
PKG_LICENSE="GPLv2"
PKG_DEPENDS_TARGET="toolchain  alsa-lib libass openssl freetype zlib retroarch-assets core-info ffmpeg libass joyutils empty nss-mdns openal-soft libogg libvorbisidec libvorbis libvpx libpng libdrm pulseaudio miniupnpc flac SDL"
PKG_LONGDESC="picoarch - a libretro frontend designed for small screens and low power."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"
TOOL32="${BUILD_ROOT}/${BUILD_BASE}.${DISTRONAME}-${DEVICE:-${PROJECT}}.arm/toolchain"
SYSROOT32="${TOOL32}/armv8a-libreelec-linux-gnueabi/sysroot"
if [ "${PIPEWIRE_SUPPORT}" = "yes" ]; then
  PKG_DEPENDS_TARGET+=" pipewire"
fi

PKG_PATCH_DIRS+=" ${DEVICE}"

case ${PROJECT} in
  Rockchip)
    PKG_DEPENDS_TARGET+=" librga"
  ;;
esac

pre_configure_target() {
# rsync for debugging local repositories in picoarch_plumOS.
# rsync -a ~/picoarch_plumOS/ ${PKG_BUILD}/

cd ${PKG_BUILD}
}

make_target() {
# You can build by adding "include .env" to the beginning of the core Makefile (.libretro) file.
unset CXXFLAGS
unset CFLAGS
unset LDFLAGS
unset CROSS_COMPILE
unset SYSROOT
export CROSS_COMPILE=${TOOL32}/bin/armv8a-libreelec-linux-gnueabi-
echo "export CROSS_COMPILE=${CROSS_COMPILE}" > ${PKG_BUILD}/.env
export SYSROOT=${SYSROOT32}
echo "export SYSROOT=${SYSROOT}" >> ${PKG_BUILD}/.env
export CC=${TOOL32}/bin/armv8a-libreelec-linux-gnueabi-gcc
echo "export CC=${CC}" >> ${PKG_BUILD}/.env
export CXX=${TOOL32}/bin/armv8a-libreelec-linux-gnueabi-g++
echo "export CXX=${CXX}" >> ${PKG_BUILD}/.env
export AR=${TOOL32}/bin/armv8a-libreelec-linux-gnueabi-ar
echo "export AR=${AR}" >> ${PKG_BUILD}/.env
export LD=${TOOL32}/bin/armv8a-libreelec-linux-gnueabi-ld
echo "export LD=${LD}" >> ${PKG_BUILD}/.env
export PKG_DIR
echo "export PKG_DIR=${PKG_DIR}" >> ${PKG_BUILD}/.env

make platform=unix
}

makeinstall_target() {
mkdir -p ${INSTALL}/usr/bin
mkdir -p ${INSTALL}/usr/config/picoarch
cp ${PKG_BUILD}/picoarch_plumOS    ${INSTALL}/usr/bin
cp ${PKG_DIR}/sources/*.sh         ${INSTALL}/usr/bin
cp ${PKG_DIR}/sources/default.gptk ${INSTALL}/usr/config/picoarch/
cp -rf ${PKG_DIR}/sources/data     ${INSTALL}/usr/config/picoarch/

# Prepare the pre-built core binary in the "sources" directory in advance.
# This process will be removed in the future once core build procedures are established.
cp ${PKG_DIR}/sources/*.so         ${INSTALL}/usr/config/picoarch/
}

post_install() {
:
}

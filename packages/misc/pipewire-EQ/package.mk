# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 plumOS (https://github.com/game-de-it/plumOS)

PKG_NAME="pipewire-EQ"
PKG_VERSION="1"
PKG_ARCH="any"
PKG_LICENSE="custom"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain rclone"
PKG_SHORTDESC="pipewire-EQ"
PKG_LONGDESC="pipewire-EQ"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

###
### Note: Start scripts for emulators have been moved to
### packages/virtual/emulators.
###

make_target() {
  :
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/config/pipewire/pipewire.conf.d
  cp ${PKG_DIR}/sources/sink-eq6.conf ${INSTALL}/usr/config/pipewire/pipewire.conf.d/
  mkdir -p ${INSTALL}/usr/bin
  cp ${PKG_DIR}/sources/Equalizer.sh ${INSTALL}/usr/bin/
  chmod 0755 ${INSTALL}/usr/bin/Equalizer.sh

  mkdir -p ${INSTALL}/usr/lib/autostart/common
  cp ${PKG_DIR}/sources/autostart/common/* ${INSTALL}/usr/lib/autostart/common
  chmod 0755 ${INSTALL}/usr/lib/autostart/common/*
}


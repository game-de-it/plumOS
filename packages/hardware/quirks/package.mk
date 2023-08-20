# SPDX-License-Identifier: Apache-2.0
# Copyright (C) 2020-present Fewtarius

PKG_NAME="quirks"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="apache2"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain autostart"
PKG_SHORTDESC="Quirks is a simple package that provides device quirks."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/lib/autostart/quirks/{platforms,devices}
  cp -r ${PKG_DIR}/devices/* ${INSTALL}/usr/lib/autostart/quirks/devices
  if [ -d "${PKG_DIR}/platforms/${DEVICE}" ]
  then
    cp -r ${PKG_DIR}/platforms/* ${INSTALL}/usr/lib/autostart/quirks/platforms
  fi
  chmod -R 0755 ${INSTALL}/usr/lib/autostart/quirks
}
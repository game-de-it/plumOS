# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2020 351ELEC team (https://github.com/fewtarius/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="es-theme-art-book-next"
PKG_VERSION="b88d2b3d31d9cbfdd68be405dcf41ace924be950"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/anthonycaccese/art-book-next-jelos"
PKG_URL="${PKG_SITE}.git"
GET_HANDLER_SUPPORT="git"
PKG_SHORTDESC="Art Book Next"
PKG_LONGDESC="Art Book Next"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/themes/${PKG_NAME}
  mkdir -p ${INSTALL}/usr/config/locale/ja_JP/LC_MESSAGES/
  cp -rf * ${INSTALL}/usr/share/themes/${PKG_NAME}
  cp ${PKG_DIR}/sources/shellscripts.png ${INSTALL}/usr/share/themes/${PKG_NAME}/_inc/systems/
  cp ${PKG_DIR}/sources/pyxel.png ${INSTALL}/usr/share/themes/${PKG_NAME}/_inc/systems/
  cp ${PKG_DIR}/sources/emulationstation2.*  ${INSTALL}/usr/config/locale/ja_JP/LC_MESSAGES/
}

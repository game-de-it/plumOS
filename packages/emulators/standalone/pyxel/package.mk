# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="pyxel"
PKG_VERSION="a3dc591ab1b881d780925a6e45a831f1fb827f2a"
PKG_SITE="https://github.com/kitao/pyxel"
PKG_URL="${PKG_SITE}.git"
PKG_LICENSE="GPLv2"
PKG_DEPENDS_TARGET="toolchain Python3"
PKG_LONGDESC="Pyxel is a retro game engine for Python."
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="make"

make_target() {
:
}

makeinstall_target() {
mkdir -p ${INSTALL}/usr/bin
rsync -av ${PKG_DIR}/sources/.pyxel/bin/pyxel ${INSTALL}/usr/bin/pyxel

mkdir -p ${INSTALL}/usr/config/pyxel
rsync -av ${PKG_DIR}/sources/.pyxel/ ${INSTALL}/usr/config/pyxel/

mkdir -p ${INSTALL}/usr/lib/python3.11/site-packages/pyxel
rsync -av ${PKG_DIR}/sources/pyxel/ ${INSTALL}/usr/lib/python3.11/site-packages/pyxel/
}

post_install() {
:
}

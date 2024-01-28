# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2024 plumOS (https://github.com/game-de-it/plumOS)

PKG_NAME="sdl12-compat"
PKG_VERSION="97e01d2bf5d50e41ed6c61c077490e3263021bcd"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libsdl-org/sdl12-compat"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain SDL2:host sdl12-compat:host"
PKG_LONGDESC="Simple DirectMedia Layer (SDL) sdl12-compat"
PKG_TOOLCHAIN="cmake"
GET_HANDLER_SUPPORT="git"

if [ "${OPENGL}" = "no" ]; then
  PKG_DEPENDS_TARGET+=" gl4es"
fi

#PKG_CMAKE_OPTS_TARGET+=" -DCMAKE_BUILD_TYPE=Release -DSDL2_INCLUDE_DIR=${INSTALL}/usr/include/SDL2"
PKG_CMAKE_OPTS_TARGET+=" -DCMAKE_BUILD_TYPE=Release" 


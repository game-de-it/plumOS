# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="xz"
PKG_VERSION="5.4.6"
PKG_LICENSE="GPL"
PKG_SITE="https://src.fedoraproject.org/lookaside/extras/xz/xz-5.4.6.tar.gz/sha512/b08a61d8d478d3b4675cb1ddacdbbd98dc6941a55bcdd81a28679e54e9367d3a595fa123ac97874a17da571c1b712e2a3e901c2737099a9d268616a1ba3de497"
PKG_URL="https://src.fedoraproject.org/lookaside/extras/xz/xz-5.4.6.tar.gz/sha512/b08a61d8d478d3b4675cb1ddacdbbd98dc6941a55bcdd81a28679e54e9367d3a595fa123ac97874a17da571c1b712e2a3e901c2737099a9d268616a1ba3de497/${PKG_NAME}-${PKG_VERSION}.tar.gz"
PKG_DEPENDS_HOST="ccache:host"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A free general-purpose data compression software with high compression ratio."
PKG_BUILD_FLAGS="+pic +pic:host"
PKG_TOOLCHAIN="configure"

# never build shared or k0p happens when building
# on fedora due to host selinux/liblzma
PKG_CONFIGURE_OPTS_HOST="--disable-shared --enable-static \
                         --disable-lzmadec \
                         --disable-lzmainfo \
                         --enable-lzma-links \
                         --disable-nls \
                         --disable-scripts \
                         --enable-symbol-versions=no"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static \
                           --enable-symbol-versions=no"

post_makeinstall_target() {
  rm -rf ${INSTALL}
}

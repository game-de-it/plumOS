#!/bin/sh

#export SDL_GAMECONTROLLERCONFIG_FILE=/usr/config/SDL-GameControllerDB/gamecontrollerdb.txt
export HOTKEY=back
export SDL_VIDEO_GL_DRIVER=/usr/lib/egl/libGL.so.1
export LIBRARY_PATH="/usr/lib32"
export LD_LIBRARY_PATH="${LIBRARY_PATH}"
export SPA_PLUGIN_DIR="${LIBRARY_PATH}/spa-0.2"
export PIPEWIRE_MODULE_DIR="${LIBRARY_PATH}/pipewire-0.3/"
export LIBGL_DRIVERS_PATH="${LIBRARY_PATH}/dri"
gptokeyb "picoarch_plumOS" -c /storage/.config/.picoarch/data/default.gptk &
PICOARCH_DIR="/storage/.config/.picoarch"
PICOARCH_LD="${PICOARCH_DIR}/bin/picoarch_plumOS_LD"
PICOARCH_HD="${PICOARCH_DIR}/bin/picoarch_plumOS_HD"
ROM="${1}"
CORE="${PICOARCH_DIR}/cores/${2}_libretro.so"
EMULATOR="${3}"

if [ "${EMULATOR}" = "picoarch_HD" ];
then
        "${PICOARCH_HD}" "${CORE}" "${ROM}"
		kill -9 $(pidof gptokeyb)
else
        "${PICOARCH_LD}" "${CORE}" "${ROM}"
		kill -9 $(pidof gptokeyb)
fi
kill -9 $(pidof gptokeyb)


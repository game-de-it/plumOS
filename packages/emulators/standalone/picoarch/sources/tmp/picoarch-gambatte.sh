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

/usr/bin/picoarch_plumOS /usr/config/picoarch/gambatte_libretro.so "${1}"
kill -9 $(pidof gptokeyb)

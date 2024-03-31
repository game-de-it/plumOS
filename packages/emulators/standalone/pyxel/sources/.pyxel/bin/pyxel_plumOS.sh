#!/bin/sh

PYXEL_DIR="/storage/.config/.pyxel"
PYXEL_BIN="/usr/bin/pyxel"
ROM="${1}"
EXTENSION=`echo "${ROM}" | awk -F. '{print $NF}'`
ROMNAME=`basename "${ROM}" | awk -F. '{print $1}'`
gptokeyb "pyxel" -c "${PYXEL_DIR}"/default.gptk &

if [ "${EXTENSION}" = "py" ];
then
        "${PYXEL_BIN}" run "${ROM}"
	kill -9 $(pidof gptokeyb)
elif [ "${EXTENSION}" = "pyxapp" ];
then
	"${PYXEL_BIN}" play "${ROM}"
	kill -9 $(pidof gptokeyb)
elif [ "${EXTENSION}" = "edit" ];
then
	mkdir -p "${PYXEL_DIR}"/save
	"${PYXEL_BIN}" edit "${PYXEL_DIR}"/save/"${ROMNAME}".pyxres
	kill -9 $(pidof gptokeyb)
	sync
else
	kill -9 $(pidof gptokeyb)
	exit 0
fi
kill -9 $(pidof gptokeyb)

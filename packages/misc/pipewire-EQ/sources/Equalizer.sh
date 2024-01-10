#!/bin/sh

#sink No 72
ALSASINK="alsa_output._sys_devices_platform_rk817-sound_sound_card0.stereo-fallback"
#sink No 34
EFFECTSINK="effect_input.eq6"
DEFSINK=`pactl get-default-sink`
if [ "${DEFSINK}" == "${ALSASINK}" ]
then
  pactl set-sink-volume "${ALSASINK}" 100%
  volume 100
  pactl set-default-sink "${EFFECTSINK}"
  pactl set-sink-volume "${EFFECTSINK}" 60%
  volume 60
  echo EQ ON
elif [ "${DEFSINK}" == "${EFFECTSINK}" ]
then
  pactl set-default-sink "${ALSASINK}"
  pactl set-sink-volume "${ALSASINK}" 60%
  volume 60
  echo EQ OFF
fi

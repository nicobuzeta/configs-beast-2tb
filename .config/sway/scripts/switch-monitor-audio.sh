#!/bin/bash

# amd_card=$(pactl list cards | awk '/Card /{card=$2} /alsa.card_name = "HDA ATI HDMI"/{gsub("#","",card); print card}')
# profile=$(echo -e "output:hdmi-stereo-extra4\noutput:hdmi-stereo-extra5" | bemenu)
# pactl set-card-profile $amd_card $profile
# sleep 0.2
# default_sink=$(pactl list short sinks | grep hdmi-stereo-extra | awk '{print $2}')
# pactl set-default-sink $default_sink

nvidia_card=$(pactl list cards | awk '/Card #/{card=$2; gsub("#", "", card)} /NVIDIA/{print card; exit}')
profile=$(echo -e "output:hdmi-stereo-extra1\noutput:hdmi-stereo-extra2\noutput:hdmi-stereo" | bemenu)
pactl set-card-profile $nvidia_card $profile
sleep 0.2
default_sink=$(pactl list short sinks | grep hdmi-stereo | awk '{print $2}')
pactl set-default-sink $default_sink

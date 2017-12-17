#!/bin/bash
set -e
docker run --cpus=4 -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --device=/dev/dri --device=/dev/nvidia0 --device=/dev/nvidiactl --device=/dev/nvidia-modeset --device=/dev/nvidia-uvm --rm --device=/dev/hackrf-one-3-12 --device=/dev/bus/usb/003/010 --device=/dev/snd  --volume=/run/user/1000/pulse:/run/user/1000/pulse -v $(pwd)/share:/home/grc/share -v /dev/shm:/dev/shm -e PULSE_SERVER=unix:/run/user/1000/pulse/native 7fb69f0aa426

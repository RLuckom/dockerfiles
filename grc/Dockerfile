# Arduino IDE configured for arduino and ESP8266 development
# Tested to work on an ubuntu 16.04 host running docker 17.09.0-ce
#
# To start the IDE UI you need to share your X11 server and $DISPLAY
# environment variable with the container. If the following start command
# doesn't work, try running `xhost +local:docker` at the command line.
#
# You also need to share the actual USB device tty where the board you want
# to program is plugged in. On your host computer, plug in the board and
# determine which tty it corresponds to. One good way to do this is to run
# `ls /dev` before plugging in the board, and running it again after
# you plug in the board. The new file, probably called `ttyUSB0` is your board.
#
# Replace `/dev/ttyUSB0` in the following start command with the path to your
# board. You need to have the board plugged in before starting the container.
#
# Start container command:
#    docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
#    --name arduino --device=/dev/ttyUSB0 raphaelluckom/arduino
#
# Debugging the container
#
# To debug the container, you still need to do the above, but you probably also
# want to be able to log in to the cli as root and poke around. Start the container
# with the command:
#    docker run -e DISPLAY=unix$DISPLAY --name arduinotest -v /tmp/.X11-unix:/tmp/.X11-unix \
#    --user=root --device=/dev/ttyUSB0 -ti --entrypoint=/bin/bash raphaelluckom/arduino
#
# This will put you into a shell where you can try to debug any issues. To try to
# start the UI from within the shell in the debugging container, run:
#    /home/arduino/arduino-1.8.5/arduino
#
# Note that this will start the arduino UI as root, which may change its behavior. Use
# `su arduino` to change to the arduino user before executing the start script.
FROM ubuntu:xenial

LABEL maintainer "raphael luckom <raphaelluckom@gmail.com>"

# update packages and install arduino dependencies
# usbutils is not strictly necessary but includes lsusb
# which can be nice for debugging
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    apt-utils sudo build-essential git usbutils ca-certificates wget python-software-properties software-properties-common
RUN add-apt-repository -y ppa:xorg-edgers/ppa && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y nvidia-384 nvidia-settings && add-apt-repository -y -r ppa:xorg-edgers/ppa

# create nonprivileged grc user
RUN groupadd -g 1000 -r grc && useradd -r -g grc -u 1000 grc\
    && mkdir -p /home/grc/hackrf_files

# allow sudo with no password, as required by build script
RUN echo "grc ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

# add grc user to the group that gets access to USB peripherals
RUN usermod -a -G dialout grc
RUN mkdir -p /home/grc/.local/share/
RUN chown -R grc:grc /home/grc

# Download grc
WORKDIR /home/grc
USER grc:grc
RUN wget http://www.sbrac.org/files/build-gnuradio && chmod 744 build-gnuradio \
    && yes | ./build-gnuradio -v all
RUN cd hackrf_files && git clone https://github.com/mossmann/hackrf.git \
    && cd hackrf/host && mkdir build && cd build && cmake .. && make && sudo make install && sudo ldconfig

RUN sudo usermod -a -G plugdev grc
RUN sudo usermod -a -G audio grc

USER grc
RUN sudo apt-get install alsa-utils
COPY pulse-client.conf /etc/pulse/client.conf 
ENTRYPOINT ["gnuradio-companion"]

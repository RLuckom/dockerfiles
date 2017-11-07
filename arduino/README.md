### Arduino IDE 1.8.5 configured for arduino and ESP8266 development
Built container: raphaelluckom/arduino:latest

Tested to work on an ubuntu 16.04 host running docker 17.09.0-ce

To start the IDE UI you need to share your X11 server and $DISPLAY
environment variable with the container. If the following start command
doesn't work, try running `xhost +local:docker` at the command line.

You also need to share the actual USB device tty where the board you want
to program is plugged in. On your host computer, plug in the board and
determine which tty it corresponds to. One good way to do this is to run
`ls /dev` before plugging in the board, and running it again after
you plug in the board. The new file, probably called `ttyUSB0` is your board.

Replace `/dev/ttyUSB0` in the following start command with the path to your
board. You need to have the board plugged in before starting the container.

Start container command:
     docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix \
     --name arduino --device=/dev/ttyUSB0 raphaelluckom/arduino

After starting the container, you need to update the arduino IDE for 
ESP8266 development manually, then commit the container to a new image.
This is necessary because the instructions for [installing the ESP8266 tools using git](https://github.com/esp8266/Arduino#using-git-version)
don't work for the most recent version of the arduino IDE. Use the instructions
for [installing the ESP8266 tools with Board Manager](https://github.com/esp8266/Arduino#installing-with-boards-manager),
then recommit the container with:

     docker commit arduino arduino

From then on, when you start a new container based on the `arduino` image,
it should already have the tools installed.

Debugging the container

To debug the container, you still need to do the above, but you probably also
want to be able to log in to the cli as root and poke around. Start the container
with the command:
     docker run -e DISPLAY=unix$DISPLAY --name arduinotest -v /tmp/.X11-unix:/tmp/.X11-unix \
     --user=root --device=/dev/ttyUSB0 -ti --entrypoint=/bin/bash raphaelluckom/arduino

This will put you into a shell where you can try to debug any issues. To try to
start the UI from within the shell in the debugging container, run:
     /home/arduino/arduino-1.8.5/arduino

Note that this will start the arduino UI as root, which may change its behavior. Use
`su arduino` to change to the arduino user before executing the start script.

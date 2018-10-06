### Build

`docker build -l slic3r .`

### Run

If the following start command doesn't work, try running `xhost +local:docker` at the command line.

`docker run --rm -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name slic3r slic3r`

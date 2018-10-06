### Build

`docker build -t blender .`

### Run

If the following start command doesn't work, try running `xhost +local:docker` at the command line.

`docker run --rm -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --name blender blender`
